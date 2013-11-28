// vim:ts=2:sts=2:sw=2:expandtab

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <ruby.h>
#include <ruby/encoding.h>

#include "Impulse.h"

static VALUE mImpulse, cEngine;

static VALUE engine_start(VALUE self) {
  im_start();
  return Qtrue;
}

static VALUE engine_stop(VALUE self) {
  im_stop();
  return Qtrue;
}

static VALUE engine_get_sample(VALUE self) {
  int i;
  VALUE fft = rb_ary_new();
  double *samples = im_getSnapshot(1);

  for (i = 0; i < 256; i++)
    rb_ary_push(fft, DBL2NUM(samples[i]));

  return fft;
}

static VALUE engine_set_source(VALUE self, VALUE source) {
  int index;

  if (TYPE(source) != T_FIXNUM)
    rb_raise(rb_eArgError, "Expect an integer source index");

  index = NUM2INT(source);
  im_setSourceIndex(index);
  return Qtrue;
}

/* init */
void Init_impulse(void) {
  mImpulse = rb_define_module("Impulse");
  cEngine  = rb_define_class_under(mImpulse, "Engine", rb_cObject);

  rb_define_method(cEngine, "start",       RUBY_METHOD_FUNC(engine_start),       0);
  rb_define_method(cEngine, "stop",        RUBY_METHOD_FUNC(engine_stop),        0);
  rb_define_method(cEngine, "get_sample",  RUBY_METHOD_FUNC(engine_get_sample),  0);
  rb_define_method(cEngine, "set_source",  RUBY_METHOD_FUNC(engine_set_source),  1);
}
