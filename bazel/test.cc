#include "dpp/nlohmann/json.hpp"
#include <fstream>
#include <iostream>


using nlohmann::json;

int main(int argv, char* args[]) {
    json dupa;
    std::ifstream in{args[1]};
    in >> dupa;
    std::cout << dupa << std::endl;
}
