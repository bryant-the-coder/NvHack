---@diagnostic disable: undefined-global
local hello = [[
#include <iostream>

int main() {
  std::cout << "Hello World" << std::endl;
  std::cin.get();
}
]]

return {
    parse({ trig = "hello" }, hello),
}
