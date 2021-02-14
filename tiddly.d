import arsd.cgi;
import std.file, std.path;

void hello(Cgi cgi) {
  cgi.header("x-api-access-type: file");
  cgi.header("dav: tw5/put");

	string filename;
	if (cgi.pathInfo == "/") {
		filename = "empty.html";
	} else {
	  filename = setExtension(cgi.pathInfo[1..$], "html");
	}
	
  if (cgi.requestMethod.to!string == "PUT") {
    std.file.write(filename, cgi.postBody);
  } else if (cgi.requestMethod.to!string == "GET") {
		if (filename.exists) {
			cgi.write(readText(filename));
		} else {
			cgi.write("There's no file named " ~ filename);
		}
  }
}
mixin GenericMain!hello;
