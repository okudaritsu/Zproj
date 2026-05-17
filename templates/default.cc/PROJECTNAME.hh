/* PROJECTNAME.hh */
#ifndef PROJECTNAME_HPP
#define PROJECTNAME_HPP

#define _GNU_SOURCE
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <cerrno>

#include <unistd.h>

#include <cstdint> // Standard C++ fixed-width types

typedef std::uint8_t  int8;
typedef std::uint16_t int16;
typedef std::uint32_t int32;
typedef std::uint64_t int64;

#define $8 (int8 *)
#define $6 (int16)
#define $2 (int32)
#define $4 (int64)
#define $c (char *)
#define $i (int)

int main(int argc, char* argv[]);

#endif
