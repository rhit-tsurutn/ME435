classdef PlateLoader < hgsetget
    % PLATELOADER Controls the Beckman Coulter Plate Loader Robot via Flask API
    
    properties
        baseUrl
        options
        xAxisPosition
        isZAxisExtended
        isGripperClosed
        isPlatePresent
    end
    properties (Constant = true)
        defaultTimeTable = [0 60 20 30 0
            0 0 30 30 0
            0 30 0 30 0
            0 30 30 0 0
            0 30 20 60 0];
    end
    
    methods
        function obj = PlateLoader(portNumberOrIP)

            if isnumeric(portNumberOrIP)
                pi_ip = '192.168.1.100'; % REPLACE WITH PI IP
            else
                pi_ip = portNumberOrIP;
            end
            
            obj.baseUrl = sprintf('http://%s:8080', pi_ip); % MAKE SURE USING 8080 
            obj.options = weboptions('Timeout', 15);
            
            try
                response = string(webread(sprintf('%s/api/RESET', obj.baseUrl), obj.options));
                fprintf('Connected to Flask: %s\n', response);
            catch
                fprintf('WARNING: Could not connect to Flask server at %s\n', obj.baseUrl);
            end
            
            obj.xAxisPosition = 3;
            obj.isZAxisExtended = false;
            obj.isGripperClosed = true;
            obj.isPlatePresent = false;
        end
        
        function response = specialMove(obj)
            % Executes special move routine over HTTP
            obj.x(1);
            obj.open();
            obj.extend();
            obj.close();
            obj.retract();
            obj.x(3);
            obj.extend();
            obj.open();
            obj.retract();
            obj.close();
            obj.x(5);
            obj.open();
            obj.extend();
            obj.close();
            obj.retract();
            obj.x(3);
            obj.open();
            response = 'READY';
        end
        
        function response = reset(obj)
            url = sprintf('%s/api/RESET', obj.baseUrl);
            response = string(webread(url, obj.options));
            
            obj.xAxisPosition = 3;
            obj.isZAxisExtended = false;
            obj.isGripperClosed = true;
        end
        
        function response = x(obj,pos)
            if (pos < 1 || pos > 5)
                fprintf('Illegal position\n');
                return
            end
            
            url = sprintf('%s/api/X-AXIS/%d', obj.baseUrl, pos);
            response = string(webread(url, obj.options));
            
            if(obj.xAxisPosition ~= pos)
                obj.isZAxisExtended = false;
            end
            obj.xAxisPosition = pos;
        end
        
        function response = extend(obj)
            url = sprintf('%s/api/Z-AXIS/EXTEND', obj.baseUrl);
            response = string(webread(url, obj.options));
            
            if startsWith(response, "ERROR")
                obj.isZAxisExtended = false;
            else
                obj.isZAxisExtended = true;
            end
        end
        
        function response = retract(obj)
            url = sprintf('%s/api/Z-AXIS/RETRACT', obj.baseUrl);
            response = string(webread(url, obj.options));
            obj.isZAxisExtended = false;
        end
        
        function response = close(obj)
            url = sprintf('%s/api/GRIPPER/CLOSE', obj.baseUrl);
            response = strtrim(string(webread(url, obj.options)));
            
            obj.isGripperClosed = true;
            if endsWith(response, "NOPLATE")
                obj.isPlatePresent = false;
            else
                obj.isPlatePresent = true;
            end
        end
        
        function response = open(obj)
            url = sprintf('%s/api/GRIPPER/OPEN', obj.baseUrl);
            response = string(webread(url, obj.options));
            
            obj.isGripperClosed = false;
            obj.isPlatePresent = false;
        end
        
        function response = movePlate(obj, startPos, endPos)
            if (startPos < 1 || startPos > 5 || endPos < 1 || endPos > 5)
                fprintf('Illegal position\n');
                return
            end
            
            url = sprintf('%s/api/MOVE/%d/%d', obj.baseUrl, startPos, endPos);
            response = string(webread(url, obj.options));
            
            if startsWith(response, "ERROR")
                obj.xAxisPosition = startPos;
                obj.isZAxisExtended = false;
                obj.isGripperClosed = false;
                obj.isPlatePresent = false;
            else
                obj.xAxisPosition = 3;
                obj.isZAxisExtended = false;
                obj.isGripperClosed = true;
                obj.isPlatePresent = false;
            end
        end
        
        function response = setTimeValues(obj,timeDelays)
            if (size(timeDelays) ~= [5 5])
                fprintf('Need a 5 by 5 matrix of time delays\n');
                return
            end
            for i = 1:5
                for j = 2:4
                    if(i ~= j)
                        % assumes flask route exists for set_delay
                        url = sprintf('%s/api/SET_DELAY/%d/%d/%d', obj.baseUrl, i, j, timeDelays(i,j));
                        try
                            response = string(webread(url, obj.options));
                            fprintf('%s\n', response);
                        catch
                            fprintf('Warning: Failed to set delay. Ensure SET_DELAY route exists on Flask.\n');
                        end
                    end
                end
            end
        end
        
        function response = resetDefaultTimes(obj)
            response = obj.setTimeValues(obj.defaultTimeTable);
        end
        
        function response = getStatus(obj)
            url = sprintf('%s/api/STATUS', obj.baseUrl);
            response = string(webread(url, obj.options));
        end
        
        function [xPos,zAxis,grip,plate] = getProperties(obj)
            xPos = obj.xAxisPosition;
            zAxis = obj.isZAxisExtended;
            grip = obj.isGripperClosed;
            plate = obj.isPlatePresent;
        end
        
        function response = shutdown(obj)
            url = sprintf('%s/api/EXIT', obj.baseUrl);
            try
                webread(url, obj.options);
            catch
                
            end
            response = 'Disconnected';
        end
        
        function disp(obj)
            fprintf('  X-AXIS %d, ',obj.xAxisPosition);
            if (obj.isZAxisExtended)
                fprintf('EXTENDED, ');
            else
                fprintf('RETRACTED, ');
            end
            if (obj.isGripperClosed)
                if( obj.isPlatePresent )
                    fprintf('CLOSED, PLATE');
                else
                    fprintf('CLOSED, NOPLATE');
                end
            else
                fprintf('OPEN');
            end
            fprintf('\n');
        end
    end
end