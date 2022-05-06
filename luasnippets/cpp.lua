---@diagnostic disable: undefined-global
local hello = [[
#include <iostream>

int main() {
  std::cout << "$1" << std::endl;
  std::cin.get();
}
]]

return {
    parse({ trig = "hello" }, hello),
}
