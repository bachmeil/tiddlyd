import arsd.cgi;
import std.file;

void hello(Cgi cgi) {
  if (cgi.pathInfo == "/empty") {
    cgi.header("x-api-access-type: file");
    cgi.header("dav: tw5/put");
    if (cgi.requestMethod.to!string == "PUT") {
      std.file.write("empty.html", cgi.postBody);
    } else if (cgi.requestMethod.to!string == "GET") {
      cgi.write(readText("empty.html"));
    }
  } else {
    cgi.write("Why are you here?");
  }
}
mixin GenericMain!hello;
