const http = require("http");

const server = http.createServer((req, res) => {

    if (req.url === "/") {
        res.end("Welcome to my application!");
    }

    else if (req.url === "/hello") {
        res.end("Hello Adeola!");
    }

    else if (req.url === "/products") {

        const products = [
            {
                name: "Reef 33",
                price: 25000
            },
            {
                name: "Azzaro Most Wanted",
                price: 85000
            }
        ];

        res.setHeader("Content-Type", "application/json");
        res.end(JSON.stringify(products));
    }

    else {
        res.statusCode = 404;
        res.end("Page not found");
    }

});

server.listen(3000, () => {
    console.log("Server running on port 3000");
});