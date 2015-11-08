package main

import (
	"flag"
	"log"
	"net/http"
)

func Log(handler http.Handler) http.Handler {
    return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
        log.Printf("%s %s %s", r.RemoteAddr, r.Method, r.URL)
	handler.ServeHTTP(w, r)
    })
}

func main() {
	port := flag.String("p", "80", "port to serve on")
	directory := flag.String("d", ".", "the directory of static file to host")
	flag.Parse()

	http.Handle("/", Log(http.FileServer(http.Dir(*directory))))

	log.Printf("Serving %s on HTTP port: %s\n", *directory, *port)
	log.Fatal(http.ListenAndServe(":"+*port, nil))
}
