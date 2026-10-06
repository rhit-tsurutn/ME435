import matlab.net.*
import matlab.net.http.*
clc
r = RequestMessage;
uri = URI("http://10.0.1.57:5000/api/");
% uri = URI("http://10.0.1.57:5000/api/MOVE 1 5");
resp = send(r,uri);
status = resp.StatusCode
response = resp.Body.Data
