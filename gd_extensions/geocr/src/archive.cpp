#include "archive.hpp"
#include <godot_cpp/classes/control.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

using namespace godot;

void Archive::_bind_methods(){
  ClassDB::bind_method(D_METHOD("print_something", "a_text"), &Archive::print_something);
}

void Archive::print_something(String a_text) {
  UtilityFunctions::print_rich(String("[b]{text}[/b]").replace("{text}", a_text));
}