defmodule DataFetcher do
  @url System.get_env("STRONG_HTML_URL") || "http://localhost:4000/"

  def fetch_data() do
    %{body: body} = Req.get!(@url, decode_body: false)
    body
  end
end

NimbleCSV.define(Parser, separator: ";")

defmodule CsvParser do
  def parse(body) do
    Parser.parse_string(body)
  end
end
