import * as http from "http";

http
  .createServer(function (req, res) {
    try {
      var url = req.url;
      if (url === "/ping") {
        res.writeHead(200, req.rawHeaders);
        res.write(req.headers);
        res.end();
      } else {
        res.writeHead(404);
        res.write("404");
        res.end();
      }
    } catch (e) {
      res.writeHead(500);
      res.write("500 " + e);
      res.end();
    }
  })
  .listen((process.env.PING_LISTEN_PORT = "3000"), function () {
    console.log("server start at port " + process.env.PING_LISTEN_PORT);
  });