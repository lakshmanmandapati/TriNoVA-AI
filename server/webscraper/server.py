import asyncio
from mcp.server.fastmcp import FastMCP
from agents import run_research

# Create FastMCP instance
mcp = FastMCP("deep_researcher_agent")


@mcp.tool()
def deep_researcher_agent(query: str) -> str:
    """Run Deep Researcher Agent for given user query. Can do both standard and deep web search.

    Args:
        query (str): The research query or question.

    Returns:
        str: The research response from the Deep Researcher Agent.
    """
    
    return run_research(query)


# Run the server
if __name__ == "__main__":
    mcp.run(transport="stdio")


# add this inside ./.cursor/mcp.json
# {
#   "mcpServers": {
#     "deep_researcher_agent": {
#       "command": "python",
#       "args": [
#         "--directory",
#         "/Users/lakshmanmandapati/Local/deep_research_agent",
#         "run",
#         "server.py"
#       ],
#       "env": {
#         "NEBIUS_API_KEY": "eyJhbGciOiJIUzI1NiIsImtpZCI6IlV6SXJWd1h0dnprLVRvdzlLZWstc0M1akptWXBvX1VaVkxUZlpnMDRlOFUiLCJ0eXAiOiJKV1QifQ.eyJzdWIiOiJnb29nbGUtb2F1dGgyfDExMjYxMjE0OTY1NjAwNjgyNTIzOCIsInNjb3BlIjoib3BlbmlkIG9mZmxpbmVfYWNjZXNzIiwiaXNzIjoiYXBpX2tleV9pc3N1ZXIiLCJhdWQiOlsiaHR0cHM6Ly9uZWJpdXMtaW5mZXJlbmNlLmV1LmF1dGgwLmNvbS9hcGkvdjIvIl0sImV4cCI6MTkxNzg3MTgxNiwidXVpZCI6IjAxOTlkMzliLWE0NWYtN2RiYi05YTJjLTM0ZWEyOGE1OTY3YyIsIm5hbWUiOiJEZWVwUmVzZWFyY2ggQWdlbnQgT2N0IDExLDI1IiwiZXhwaXJlc19hdCI6IjIwMzAtMTAtMTBUMTQ6MTA6MTYrMDAwMCJ9.hTimVrXlhT4N4PIL9IdA95BlONKK38SBKsjzJvPHqxQ",
#         "SGAI_API_KEY": "sgai-cf9f14cc-fe8f-424e-a31a-b5a96e1ca1ab"
#       }
#     }
#   }
# }
