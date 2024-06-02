#pragma once

#include <godot_cpp/classes/control.hpp>
#include <godot_cpp/variant/utility_functions.hpp>

using namespace godot;

class Archive: public Resource{
  GDCLASS(Archive, Resource);

  private:

  public:
    void print_something(String a_text);

  protected:
    static void _bind_methods();
};