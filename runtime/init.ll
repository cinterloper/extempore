;;
;; Copyright (c) 2011, Andrew Sorensen
;;
;; All rights reserved
;;
;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:
;;
;; 1. Redistributions of source code must retain the above copyright notice,
;;    this list of conditions and the following disclaimer.
;;
;; 2. Redistributions in binary form must reproduce the above copyright notice,
;;    this list of conditions and the following disclaimer in the documentation
;;    and/or other materials provided with the distribution.
;;
;; Neither the name of the authors nor other contributors may be used to endorse
;; or promote products derived from this software without specific prior written
;; permission.
;;
;;
;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
;; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;; POSSIBILITY OF SUCH DAMAGE.
;;
;;

;; malloc zone structures
;; %mzone = type {i8*, i64, i64, i64, i8*, %mzone*}
;; %clsvar = type {i8*, i32, i8*, %clsvar*}

;; alias for environment data
%envt = type i8*

;; regex stuff
declare i1 @rmatch(i8*,i8*)
declare i64 @rmatches(i8*,i8*,i8**,i64)
declare i1 @rsplit(i8*,i8*,i8*,i8*)
declare i8* @rreplace(i8*,i8*,i8*,i8*)

;; base64 stuff
;; i64's here should be size_t !!!
declare i8* @base64_encode(i8*,i64,i64)
declare i8* @base64_decode(i8*,i64,i64)
declare i8* @cname_encode(i8*,i64,i64)
declare i8* @cname_decode(i8*,i64,i64)

declare double @clock_clock()
declare double @audio_clock_base()
declare double @audio_clock_now()

declare i32 @register_for_window_events()

declare void @xtm_set_main_callback(i8*)

;; swap stuff
declare i64 @swap64f(double)
declare double @unswap64f(i64)
declare i32 @swap32f(float)
declare float @unswap32f(i32)
declare i64 @swap64i(i64)
declare i64 @unswap64i(i64)
declare i32 @swap32i(i32)
declare i32 @unswap32i(i32)


;; thread stuff
declare i8* @thread_fork(i8*,i8*);
declare void @thread_destroy(i8*);
declare i32 @thread_join(i8*);
declare i32 @thread_kill(i8*);
declare i8* @thread_self();
declare i32 @thread_equal_self(i8*);
declare i32 @thread_equal(i8*,i8*);
declare i64 @thread_sleep(i64,i64);
declare i8* @mutex_create()
declare i32 @mutex_destroy(i8*)
declare i32 @mutex_lock(i8*)
declare i32 @mutex_unlock(i8*)
declare i32 @mutex_trylock(i8*)

declare void @llvm_runtime_error(i64,i8*) nounwind
declare i1 @llvm_zone_copy_ptr(i8*, i8*) nounwind
declare i64 @llvm_zone_ptr_size(i8*) nounwind
declare i1 @llvm_ptr_in_current_zone(i8*) nounwind
declare void @llvm_print_pointer(i8*)
declare void @llvm_print_i32(i32)
declare void @llvm_print_i64(i64)
declare void @llvm_print_f32(float)
declare void @llvm_print_f64(double)
declare i8* @extitoa(i64)
declare i64 @string_hash(i8*)
declare void @llvm_schedule_callback(i64, i8*)
declare i8* @llvm_get_function_ptr(i8*)

declare void @llvm_send_udp(i8*,i32,i8*,i32)
declare i64 @next_prime(i64)

;; stdlib.h
declare void @abort()
declare void @exit(i32)
declare i32 @raise(i32)

declare i8* @malloc(i64) nounwind
declare i8* @calloc(i64,i64) nounwind
declare i8* @realloc(i8*,i64) nounwind
declare void @free(i8*) nounwind
declare i8* @malloc16(i64) nounwind
declare void @free16(i8*) nounwind

declare i32 @system(i8*) nounwind
declare i8* @getenv(i8*) nounwind
declare i32 @setenv(i8*, i8*, i32) nounwind
declare i32 @unsetenv(i8*) nounwind
declare i8* @sys_sharedir() nounwind
declare i8* @sys_slurp_file(i8*) nounwind

;;
declare i32 @abs(i32)
declare i64 @llabs(i64)


;; scheme.h stuff
declare i8* @mk_i64(i8*,i64)
declare i8* @mk_i32(i8*,i32)
declare i8* @mk_i16(i8*,i16)
declare i8* @mk_i8(i8*,i8)
declare i8* @mk_i1(i8*,i1)
declare i8* @mk_double(i8*,double)
declare i8* @mk_float(i8*,float)
declare i8* @mk_string(i8*,i8*)
declare i8* @mk_cptr(i8*,i8*)

declare i64 @i64value(i8*)
declare i32 @i32value(i8*)
declare i16 @i16value(i8*)
declare i8 @i8value(i8*)
declare i1 @i1value(i8*)
declare double @r64value(i8*)
declare float @r32value(i8*)
;; declare i32 @is_real(i8*)
declare i8* @string_value(i8*)
declare i8* @cptr_value(i8*)
;; declare i32 @is_cptr(i8*)
;; declare i32 @is_cptr_or_str(i8*)

declare i8* @list_ref(i8*,i32,i8*)

declare i32 @rand()


declare double @tan(double)
declare float @tanf(float)
declare double @cosh(double)
declare float @coshf(float)
declare double @tanh(double)
declare float @tanhf(float)
declare double @sinh(double)
declare float @sinhf(float)
declare double @acos(double)
declare float @acosf(float)
declare double @asin(double)
declare float @asinf(float)
declare double @atan(double)
declare float @atanf(float)
declare double @atan2(double, double)
declare float @atan2f(float, float)

;; c99 math.h stuff
declare double @acosh(double)
declare double @asinh(double)
declare double @atanh(double)
declare double @cbrt(double)
declare double @copysign(double,double)
declare double @erf(double)
declare double @erfc(double)
; declare double @exp2(double)
declare double @expm1(double)
declare double @fdim(double,double)
; declare double @fma(double,double,double)
declare double @fmax(double,double)
declare double @fmin(double,double)
declare double @hypot(double,double)
declare double @ilogb(double)
declare double @lgamma(double)
declare i64 @llrint(double)
declare i64 @lrint(double)
declare i32 @rint(double)
declare i64 @llround(double)
declare i32 @lround(double)
declare double @log1p(double)
declare i32 @logb(double)
declare double @nan(i8*)
; declare double @nearbyint(double)
declare double @nextafter(double,double)
declare double @nexttoward(double,double)
declare double @remainder(double, double)
declare double @remquo(double, double, i8*)
; declare double @round(double)
declare double @scalbn(double,i32)
declare double @tgamma(double)
declare double @trunc(double)

declare float @acoshf(float)
declare float @asinhf(float)
declare float @atanhf(float)
declare float @cbrtf(float)
declare float @copysignf(float,float)
declare float @erff(float)
declare float @erfcf(float)
; declare float @exp2f(float)
declare float @expm1f(float)
declare float @fdimf(float,float)
; declare float @fmaf(float,float,float)
declare float @fmaxf(float,float)
declare float @fminf(float,float)
declare double @fmod(double, double)
declare float @fmodf(float, float)
declare float @hypotf(float,float)
declare float @ilogbf(float)
declare float @lgammaf(float)
declare i64 @llrintf(float)
declare i64 @lrintf(float)
declare i32 @rintf(float)
declare i64 @llroundf(float)
declare i32 @lroundf(float)
declare float @log1pf(float)
declare float @log2f(float)
declare i32 @logbf(float)
declare float @nanf(i8*)
; declare float @nearbyintf(float)
declare float @nextafterf(float,float)
declare float @nexttowardf(float,float)
declare float @remainderf(float, float)
declare float @remquof(float, float, i8*)
; declare float @roundf(float)
declare float @scalbnf(float,i32)
declare float @tgammaf(float)
; declare float @truncf(float)

;; llvm math intrinsics

declare double @llvm.sin.f64(double)
declare double @llvm.cos.f64(double)
declare double @llvm.ceil.f64(double)
declare double @llvm.floor.f64(double)
declare double @llvm.exp.f64(double)
declare double @llvm.pow.f64(double,double)
declare double @llvm.log.f64(double)
declare double @llvm.log2.f64(double)
declare double @llvm.log10.f64(double)
declare double @llvm.sqrt.f64(double)
declare double @llvm.fabs.f64(double)
declare double @llvm.round.f64(double)
declare double @llvm.trunc.f64(double)
declare double @llvm.nearbyint.f64(double)
declare double @llvm.fma.f64(double,double,double)
declare double @llvm.exp2.f64(double)
declare double @llvm.powi.f64(double,i32)

declare float @llvm.sin.f32(float)
declare float @llvm.cos.f32(float)
declare float @llvm.ceil.f32(float)
declare float @llvm.floor.f32(float)
declare float @llvm.exp.f32(float)
declare float @llvm.pow.f32(float,float)
declare float @llvm.log.f32(float)
declare float @llvm.log2.f32(float)
declare float @llvm.log10.f32(float)
declare float @llvm.sqrt.f32(float)
declare float @llvm.fabs.f32(float)
declare float @llvm.round.f32(float)
declare float @llvm.trunc.f32(float)
declare float @llvm.nearbyint.f32(float)
declare float @llvm.fma.f32(float,float,float)
declare float @llvm.exp2.f32(float)
declare float @llvm.powi.f32(float,i32)

declare <2 x double> @llvm.sin.v2f64(<2 x double>)
declare <2 x double> @llvm.cos.v2f64(<2 x double>)
declare <2 x double> @llvm.ceil.v2f64(<2 x double>)
declare <2 x double> @llvm.floor.v2f64(<2 x double>)
declare <2 x double> @llvm.exp.v2f64(<2 x double>)
declare <2 x double> @llvm.fmod.v2f64(<2 x double>)
declare <2 x double> @llvm.pow.v2f64(<2 x double>,<2 x double>)
declare <2 x double> @llvm.log.v2f64(<2 x double>)
declare <2 x double> @llvm.log2.v2f64(<2 x double>)
declare <2 x double> @llvm.log10.v2f64(<2 x double>)
declare <2 x double> @llvm.sqrt.v2f64(<2 x double>)
declare <2 x double> @llvm.fabs.v2f64(<2 x double>)
declare <2 x double> @llvm.round.v2f64(<2 x double>)
declare <2 x double> @llvm.trunc.v2f64(<2 x double>)
declare <2 x double> @llvm.nearbyint.v2f64(<2 x double>)
declare <2 x double> @llvm.fma.v2f64(<2 x double>,<2 x double>,<2 x double>)
declare <2 x double> @llvm.exp2.v2f64(<2 x double>)
declare <2 x double> @llvm.powi.v2f64(<2 x double>,<2 x i32>)

declare <4 x double> @llvm.sin.v4f64(<4 x double>)
declare <4 x double> @llvm.cos.v4f64(<4 x double>)
declare <4 x double> @llvm.ceil.v4f64(<4 x double>)
declare <4 x double> @llvm.floor.v4f64(<4 x double>)
declare <4 x double> @llvm.exp.v4f64(<4 x double>)
declare <4 x double> @llvm.fmod.v4f64(<4 x double>)
declare <4 x double> @llvm.pow.v4f64(<4 x double>,<4 x double>)
declare <4 x double> @llvm.log.v4f64(<4 x double>)
declare <4 x double> @llvm.log2.v4f64(<4 x double>)
declare <4 x double> @llvm.log10.v4f64(<4 x double>)
declare <4 x double> @llvm.sqrt.v4f64(<4 x double>)
declare <4 x double> @llvm.fabs.v4f64(<4 x double>)
declare <4 x double> @llvm.round.v4f64(<4 x double>)
declare <4 x double> @llvm.trunc.v4f64(<4 x double>)
declare <4 x double> @llvm.nearbyint.v4f64(<4 x double>)
declare <4 x double> @llvm.fma.v4f64(<4 x double>,<4 x double>,<4 x double>)
declare <4 x double> @llvm.exp2.v4f64(<4 x double>)
declare <4 x double> @llvm.powi.v4f64(<4 x double>,<4 x i32>)

declare <4 x float> @llvm.sin.v4f32(<4 x float>)
declare <4 x float> @llvm.cos.v4f32(<4 x float>)
declare <4 x float> @llvm.ceil.v4f32(<4 x float>)
declare <4 x float> @llvm.floor.v4f32(<4 x float>)
declare <4 x float> @llvm.exp.v4f32(<4 x float>)
declare <4 x float> @llvm.fmod.v4f32(<4 x float>)
declare <4 x float> @llvm.pow.v4f32(<4 x float>,<4 x float>)
declare <4 x float> @llvm.log.v4f32(<4 x float>)
declare <4 x float> @llvm.log2.v4f32(<4 x float>)
declare <4 x float> @llvm.log10.v4f32(<4 x float>)
declare <4 x float> @llvm.sqrt.v4f32(<4 x float>)
declare <4 x float> @llvm.fabs.v4f32(<4 x float>)
declare <4 x float> @llvm.round.v4f32(<4 x float>)
declare <4 x float> @llvm.trunc.v4f32(<4 x float>)
declare <4 x float> @llvm.nearbyint.v4f32(<4 x float>)
declare <4 x float> @llvm.fma.v4f32(<4 x float>,<4 x float>,<4 x float>)
declare <4 x float> @llvm.exp2.v4f32(<4 x float>)
declare <4 x float> @llvm.powi.v4f32(<4 x float>,<4 x i32>)

declare <8 x float> @llvm.sin.v8f32(<8 x float>)
declare <8 x float> @llvm.cos.v8f32(<8 x float>)
declare <8 x float> @llvm.ceil.v8f32(<8 x float>)
declare <8 x float> @llvm.floor.v8f32(<8 x float>)
declare <8 x float> @llvm.exp.v8f32(<8 x float>)
declare <8 x float> @llvm.fmod.v8f32(<8 x float>)
declare <8 x float> @llvm.pow.v8f32(<8 x float>,<8 x float>)
declare <8 x float> @llvm.log.v8f32(<8 x float>)
declare <8 x float> @llvm.log2.v8f32(<8 x float>)
declare <8 x float> @llvm.log10.v8f32(<8 x float>)
declare <8 x float> @llvm.sqrt.v8f32(<8 x float>)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>)
declare <8 x float> @llvm.round.v8f32(<8 x float>)
declare <8 x float> @llvm.trunc.v8f32(<8 x float>)
declare <8 x float> @llvm.nearbyint.v8f32(<8 x float>)
declare <8 x float> @llvm.fma.v8f32(<8 x float>,<8 x float>,<8 x float>)
declare <8 x float> @llvm.exp2.v8f32(<8 x float>)
declare <8 x float> @llvm.powi.v8f32(<8 x float>,<8 x i32>)

;; stdio.h stuff
declare void @clearerr(i8*)
declare i8* @ctermid(i8*)
declare i32 @fclose(i8*)
declare i8* @fdopen(i32,  i8*)
declare i32 @feof(i8*)
declare i32 @ferror(i8*)
declare i32 @fflush(i8*)
declare i32 @fgetc(i8*)
declare i8* @fgets(i8*, i32, i8*)
declare i32 @fileno(i8*)
declare void @flockfile(i8*)
declare i8* @fopen( i8*,  i8*)
declare i32 @fputc(i32, i8*)
declare i32 @fputs( i8*, i8*)
declare i64 @fread(i8*, i64, i64, i8*)
declare i8* @freopen( i8*,  i8*, i8*)
declare i32 @fseek(i8*, i64, i32)
declare i64 @ftell(i8*)
declare i32 @ftrylockfile(i8*)
declare void @funlockfile(i8*)
declare i64 @fwrite( i8*, i64, i64, i8*)
declare i32 @getc(i8*)
declare i32 @getchar()
declare i32 @getc_unlocked(i8*)
declare i32 @getchar_unlocked()
declare i8* @gets(i8*)
declare i32 @getw(i8*)
declare i32 @pclose(i8*)
declare void @perror( i8*)
declare i8* @popen( i8*,  i8*)
declare i32 @putc(i32, i8*)
declare i32 @putchar(i32)
declare i32 @putc_unlocked(i32, i8*)
declare i32 @putchar_unlocked(i32)
declare i32 @puts(i8*)
declare i32 @putw(i32, i8*)
declare i32 @remove( i8*)
declare i32 @rename( i8*,  i8*)
declare void @rewind(i8*)
declare void @setbuf(i8*, i8*)
declare i32 @setvbuf(i8*, i8*, i32, i64)
declare i8* @tempnam(i8*, i8*)
declare i8* @tmpfile()
declare i8* @tmpnam(i8*)
declare i32 @ungetc(i32, i8*)

;; string stuff
declare double @atof(i8*)
declare i32 @atoi(i8*)
declare i64 @atol(i8*)

declare i8* @memccpy(i8*, i8*, i32, i64)
declare i8* @memchr(i8*, i32, i64)
declare i32 @memcmp(i8*, i8*, i64)
declare i8* @memmove(i8*, i8*, i64)
declare i8* @strcat(i8*, i8*)
declare i8* @strchr(i8*, i32)
declare i32 @strcmp(i8*, i8*)
declare i32 @strcoll(i8*, i8*)
declare i8* @strcpy(i8*, i8*)
declare i64 @strcspn(i8*, i8*)
declare i8* @strdup(i8*)
declare i8* @strerror(i32)
declare i64 @strlen(i8*)
declare i8* @strncat(i8*, i8*, i64)
declare i32 @strncmp(i8*, i8*, i64)
declare i8* @strncpy(i8*, i8*, i64)
declare i8* @strpbrk(i8*, i8*)
declare i8* @strrchr(i8*, i32)
declare i64 @strspn(i8*, i8*)
declare i8* @strstr(i8*, i8*)
declare i8* @strtok(i8*, i8*)
declare i8* @strtok_r(i8*, i8*, i8**)
declare i64 @strxfrm(i8*, i8*, i64)

;; misc C lib stuff
declare void @longjmp(i8*,i32)
declare i32 @setjmp(i8*)
declare i8* @dlsym(i8*, i8*)

declare double @imp_randd()
declare float @imp_randf()
declare i64 @imp_rand1_i64(i64)
declare i64 @imp_rand2_i64(i64,i64)
declare i32 @imp_rand1_i32(i32)
declare i32 @imp_rand2_i32(i32,i32)
declare float @imp_rand1_f(float)
declare float @imp_rand2_f(float,float)
declare double @imp_rand1_d(double)
declare double @imp_rand2_d(double,double)

declare void @llvm_destroy_zone_after_delay(%mzone*, i64)
declare void @free_after_delay(i8*, double)
declare i8* @llvm_disassemble(i8*,i32)

%wt = type double (i8*, i8*, double, i64, i64, double*)

define dllexport double @imp_dsp_wrapper(i8* %_impz, i8* %closure, double %sample, i64 %time, i64 %channel, double* %data)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, %wt* }*
  ; apply closure
  %fPtr = getelementptr { i8*, i8*, %wt* }, { i8*, i8*, %wt* }* %closureVal, i32 0, i32 2
  %ePtr = getelementptr { i8*, i8*, %wt* }, { i8*, i8*, %wt* }* %closureVal, i32 0, i32 1
  %f = load %wt*, %wt** %fPtr
  %e = load i8*, i8** %ePtr
  %result = tail call fastcc double %f(i8* %_impz, i8* %e, double %sample, i64 %time, i64 %channel, double* %data)
  ret double %result
}

%wts = type double (i8*, i8*, double*, i64, i64, double*)

define dllexport double @imp_dsp_sum_wrapper(i8* %_impz, i8* %closure, double* %sample, i64 %time, i64 %channel, double* %data)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, %wts* }*
  ; apply closure
  %fPtr = getelementptr { i8*, i8*, %wts* }, { i8*, i8*, %wts* }* %closureVal, i32 0, i32 2
  %ePtr = getelementptr { i8*, i8*, %wts* }, { i8*, i8*, %wts* }* %closureVal, i32 0, i32 1
  %f = load %wts*, %wts** %fPtr
  %e = load i8*, i8** %ePtr
  %result = tail call fastcc double %f(i8* %_impz, i8* %e, double* %sample, i64 %time, i64 %channel, double* %data)
  ret double %result
}

%wt_f = type float (i8*, i8*, float, i64, i64, float*)

define dllexport float @imp_dspf_wrapper(i8* %_impz, i8* %closure, float %sample, i64 %time, i64 %channel, float* %data)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, %wt_f*}*
  ; apply closure
  %fPtr = getelementptr { i8*, i8*, %wt_f* }, { i8*, i8*, %wt_f* }* %closureVal, i32 0, i32 2
  %ePtr = getelementptr { i8*, i8*, %wt_f* }, { i8*, i8*, %wt_f* }* %closureVal, i32 0, i32 1
  %f = load %wt_f*, %wt_f** %fPtr
  %e = load i8*, i8** %ePtr
  %result = tail call fastcc float %f(i8* %_impz, i8* %e, float %sample, i64 %time, i64 %channel, float* %data)
  ret float %result
}

%wts_f = type float (i8*, i8*, float*, i64, i64, float*)

define dllexport float @imp_dspf_sum_wrapper(i8* %_impz, i8* %closure, float* %sample, i64 %time, i64 %channel, float* %data)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, %wts_f* }*
  ; apply closure
  %fPtr = getelementptr { i8*, i8*, %wts_f* }, { i8*, i8*, %wts_f* }* %closureVal, i32 0, i32 2
  %ePtr = getelementptr { i8*, i8*, %wts_f* }, { i8*, i8*, %wts_f* }* %closureVal, i32 0, i32 1
  %f = load %wts_f*, %wts_f** %fPtr
  %e = load i8*, i8** %ePtr
  %result = tail call fastcc float %f(i8* %_impz, i8* %e, float* %sample, i64 %time, i64 %channel, float* %data)
  ret float %result
}

%wta = type void (i8*, i8*, float*, float*, i64, i8*)

define dllexport void @imp_dsp_wrapper_array(i8* %_impz, i8* %closure, float* %datain, float* %dataout, i64 %time, i8* %data)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, %wta*}*
  ; apply closure
  %fPtr = getelementptr { i8*, i8*, %wta* }, { i8*, i8*, %wta*}* %closureVal, i32 0, i32 2
  %ePtr = getelementptr { i8*, i8*, %wta* }, { i8*, i8*, %wta*}* %closureVal, i32 0, i32 1
  %f = load %wta*, %wta** %fPtr
  %e = load i8*, i8** %ePtr
  tail call fastcc void %f(i8* %_impz, i8* %e, float* %datain, float* %dataout, i64 %time, i8* %data)
  ret void
}

%wta_s = type void (i8*, i8*, float**, float*, i64, i8*)

define dllexport void @imp_dsp_sum_wrapper_array(i8* %_impz, i8* %closure, float** %datain, float* %dataout, i64 %time, i8* %data)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, %wta_s*}*
  ; apply closure
  %fPtr = getelementptr { i8*, i8*, %wta_s* }, {i8*, i8*, %wta_s*}* %closureVal, i32 0, i32 2
  %ePtr = getelementptr { i8*, i8*, %wta_s* }, {i8*, i8*, %wta_s*}* %closureVal, i32 0, i32 1
  %f = load %wta_s*, %wta_s** %fPtr
  %e = load i8*, i8** %ePtr
  tail call fastcc void %f(i8* %_impz, i8* %e, float** %datain, float* %dataout, i64 %time, i8* %data)
  ret void
}

define dllexport i8* @impc_get_env(i8* %impz, i8* %closure)
{
entry:
  %closureVal = bitcast i8* %closure to { i8*, i8*, i8* }*
  %ePtr = getelementptr { i8*, i8*, i8* }, { i8*, i8*, i8* }* %closureVal, i32 0, i32 1
  %e = load i8*, i8** %ePtr
  ret i8* %e
}

declare i8* @memset(i8* %dest, i32 %val, i64 %len)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8*, i8*, i64, i32, i1)

declare %mzone* @llvm_zone_callback_setup() nounwind
declare %mzone* @llvm_pop_zone_stack() nounwind
declare void @llvm_zone_destroy(%mzone*) nounwind
declare void @llvm_zone_print(%mzone*) nounwind
declare i8* @llvm_zone_malloc(%mzone*, i64) nounwind
declare i8* @llvm_zone_malloc_from_current_zone(i64) nounwind
declare i1 @llvm_ptr_in_zone(%mzone*, i8*) nounwind

declare %clsvar* @add_address_table(%mzone*, i8*, i32, i8*, i32, %clsvar*) nounwind
declare %clsvar* @get_address_table(i8*, %clsvar*) nounwind
declare i32 @get_address_offset(i64, %clsvar*) nounwind
declare i1 @check_address_type(i64, %clsvar*, i8*) nounwind
declare i1 @check_address_exists(i64, %clsvar*) nounwind

declare i32 @printf(i8* noalias nocapture, ...)
declare i32 @sprintf(i8*, i8* noalias nocapture, ...)
declare i32 @sscanf(i8*, i8* noalias nocapture, ...)
declare i32 @fprintf(i8*, i8* noalias nocapture, ...)
declare i32 @fscanf(i8*, i8* noalias nocapture, ...)

define %clsvar* @new_address_table() nounwind alwaysinline
{
  ret %clsvar* null
}

declare %mzone* @llvm_peek_zone_stack_extern() nounwind

declare void @llvm_push_zone_stack_extern(%mzone*) nounwind
define void @llvm_push_zone_stack(%mzone* %zone) nounwind alwaysinline "thunk"
{
  call void @llvm_push_zone_stack_extern(%mzone* %zone)
  ret void
}

declare %mzone* @llvm_zone_create_extern(i64) nounwind
define %mzone* @llvm_zone_create(i64 %size) nounwind alwaysinline "thunk"
{
  %zone = call %mzone* @llvm_zone_create_extern(i64 %size)
  ret %mzone* %zone
}

define void @llvm_zone_mark(%mzone* %zone) nounwind alwaysinline
{
  %offset_ptr = getelementptr inbounds %mzone, %mzone* %zone, i32 0, i32 1
  %offset_val = load i64, i64* %offset_ptr
  %mark_ptr = getelementptr %mzone, %mzone* %zone, i32 0, i32 2
  store i64 %offset_val, i64* %mark_ptr
  ret void
}

define i64 @llvm_zone_mark_size(%mzone* %zone) nounwind alwaysinline
{
  %offset_ptr = getelementptr inbounds %mzone, %mzone* %zone, i32 0, i32 1
  %offset_val = load i64, i64* %offset_ptr
  %mark_ptr = getelementptr %mzone, %mzone* %zone, i32 0, i32 2
  %mark_val = load i64, i64* %mark_ptr
  %res = sub i64 %offset_val, %mark_val
  ret i64 %res
}

define %mzone* @llvm_zone_reset(%mzone* %zone) nounwind alwaysinline
{
  %offset_ptr = getelementptr inbounds %mzone, %mzone* %zone, i32 0, i32 1
  store i64 0, i64* %offset_ptr
  ret %mzone* %zone
}

declare i32 @is_integer_extern(i8*)
define i32 @is_integer(i8* %ptr) nounwind alwaysinline
{
  %res = call i32 @is_integer_extern(i8* %ptr)
  ret i32 %res
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SCHEME STUFF

define i8* @impc_null() nounwind alwaysinline
{
  ret i8* null
}

define i1 @impc_true() nounwind alwaysinline
{
  ret i1 1
}

define i1 @impc_false() nounwind alwaysinline
{
  ret i1 0
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CASTING STUFF

define i64 @i1toi64(i1 %a) alwaysinline
{
  %return = zext i1 %a to i64
  ret i64 %return
}

define i32 @i1toi32(i1 %a) alwaysinline
{
  %return = zext i1 %a to i32
  ret i32 %return
}

define i16 @i1toi16(i1 %a) alwaysinline
{
  %return = zext i1 %a to i16
  ret i16 %return
}

define i8 @i1toi8(i1 %a) alwaysinline
{
  %return = zext i1 %a to i8
  ret i8 %return
}

define i1 @i64toi1(i64 %a) alwaysinline
{
entry:
%return = trunc i64 %a to i1
ret i1 %return
}

define i1 @i32toi1(i32 %a) alwaysinline
{
  %return = trunc i32 %a to i1
  ret i1 %return
}

define i1 @i16toi1(i16 %a) alwaysinline
{
  %return = trunc i16 %a to i1
  ret i1 %return
}

define i1 @i8toi1(i8 %a) alwaysinline
{
  %return = trunc i8 %a to i1
  ret i1 %return
}

;; i8 casts
define i64 @i8toi64(i8 %a) alwaysinline
{
  %return = sext i8 %a to i64
  ret i64 %return
}

define i64 @i8toui64(i8 %a) alwaysinline
{
  %return = zext i8 %a to i64
  ret i64 %return
}

define i32 @i8toi32(i8 %a) alwaysinline
{
  %return = sext i8 %a to i32
  ret i32 %return
}

define i16 @i8toi16(i8 %a) alwaysinline
{
  %return = sext i8 %a to i16
  ret i16 %return
}

define i32 @i8toui32(i8 %a) alwaysinline
{
  %return = zext i8 %a to i32
  ret i32 %return
}

define i8 @i64toi8(i64 %a) alwaysinline
{
  %return = trunc i64 %a to i8
  ret i8 %return
}

define i8 @i32toi8(i32 %a) alwaysinline
{
  %return = trunc i32 %a to i8
  ret i8 %return
}

define i8 @i16toi8(i16 %a) alwaysinline
{
  %return = trunc i16 %a to i8
  ret i8 %return
}

;; i16 casts
define i64 @i16toi64(i16 %a) alwaysinline
{
  %return = sext i16 %a to i64
  ret i64 %return
}

define i64 @i16toui64(i16 %a) alwaysinline
{
  %return = zext i16 %a to i64
  ret i64 %return
}

define i32 @i16toi32(i16 %a) alwaysinline
{
  %return = sext i16 %a to i32
  ret i32 %return
}

define i32 @i16toui32(i16 %a) alwaysinline
{
  %return = zext i16 %a to i32
  ret i32 %return
}

define i16 @i64toi16(i64 %a) alwaysinline
{
entry:
%return = trunc i64 %a to i16
ret i16 %return
}

define i16 @i32toi16(i32 %a) alwaysinline
{
  %return = trunc i32 %a to i16
  ret i16 %return
}

;; i32 casts
define i64 @i32toi64(i32 %a) alwaysinline
{
  %return = sext i32 %a to i64
  ret i64 %return
}

define i64 @i32toui64(i32 %a) alwaysinline
{
  %return = zext i32 %a to i64
  ret i64 %return
}

define i32 @i64toi32(i64 %a) alwaysinline
{
entry:
%return = trunc i64 %a to i32
ret i32 %return
}


;; float casts
define double @ftod(float %a) alwaysinline
{
  %return = fpext float %a to double
  ret double %return
}

define i64 @ftoi64(float %a) alwaysinline
{
  %return = fptosi float %a to i64
  ret i64 %return
}

define i32 @ftoi32(float %a) alwaysinline
{
  %return = fptosi float %a to i32
  ret i32 %return
}

define i16 @ftoi16(float %a) alwaysinline
{
  %return = fptosi float %a to i16
  ret i16 %return
}

define i8 @ftoi8(float %a) alwaysinline
{
  %return = fptosi float %a to i8
  ret i8 %return
}

define i1 @ftoi1(float %a) alwaysinline
{
  %return = fptosi float %a to i1
  ret i1 %return
}

define i64 @ftoui64(float %a) alwaysinline
{
  %return = fptoui float %a to i64
  ret i64 %return
}

define i32 @ftoui32(float %a) alwaysinline
{
  %return = fptoui float %a to i32
  ret i32 %return
}

define i16 @ftoui16(float %a) alwaysinline
{
  %return = fptoui float %a to i16
  ret i16 %return
}

define i8 @ftoui8(float %a) alwaysinline
{
  %return = fptoui float %a to i8
  ret i8 %return
}

define i1 @ftoui1(float %a) alwaysinline
{
  %return = fptoui float %a to i1
  ret i1 %return
}

define float @i64tof(i64 %a) alwaysinline
{
entry:
%return = sitofp i64 %a to float
ret float %return
}

define float @i32tof(i32 %a) alwaysinline
{
  %return = sitofp i32 %a to float
  ret float %return
}

define float @i16tof(i16 %a) alwaysinline
{
  %return = sitofp i16 %a to float
  ret float %return
}

define float @i8tof(i8 %a) alwaysinline
{
  %return = sitofp i8 %a to float
  ret float %return
}

define float @i1tof(i1 %a) alwaysinline
{
  %return = sitofp i1 %a to float
  ret float %return
}

define float @ui64tof(i64 %a) alwaysinline
{
entry:
%return = uitofp i64 %a to float
ret float %return
}

define float @ui32tof(i32 %a) alwaysinline
{
entry:
%return = uitofp i32 %a to float
ret float %return
}

define float @ui16tof(i16 %a) alwaysinline
{
entry:
%return = uitofp i16 %a to float
ret float %return
}

define float @ui8tof(i8 %a) alwaysinline
{
entry:
%return = uitofp i8 %a to float
ret float %return
}

define float @ui1tof(i1 %a) alwaysinline
{
entry:
%return = uitofp i1 %a to float
ret float %return
}

;; double casts

define float @dtof(double %a) alwaysinline
{
  %return = fptrunc double %a to float
  ret float %return
}

define i64 @dtoi64(double %a) alwaysinline
{
  %return = fptosi double %a to i64
  ret i64 %return
}

define i32 @dtoi32(double %a) alwaysinline
{
  %return = fptosi double %a to i32
  ret i32 %return
}

define i16 @dtoi16(double %a) alwaysinline
{
  %return = fptosi double %a to i16
  ret i16 %return
}

define i8 @dtoi8(double %a) alwaysinline
{
  %return = fptosi double %a to i8
  ret i8 %return
}

define i1 @dtoi1(double %a) alwaysinline
{
  %return = fptosi double %a to i1
  ret i1 %return
}

define i64 @dtoui64(double %a) alwaysinline
{
  %return = fptoui double %a to i64
  ret i64 %return
}

define i32 @dtoui32(double %a) alwaysinline
{
  %return = fptoui double %a to i32
  ret i32 %return
}

define i16 @dtoui16(double %a) alwaysinline
{
  %return = fptoui double %a to i16
  ret i16 %return
}

define i8 @dtoui8(double %a) alwaysinline
{
  %return = fptoui double %a to i8
  ret i8 %return
}

define i1 @dtoui1(double %a) alwaysinline
{
  %return = fptoui double %a to i1
  ret i1 %return
}

define double @i64tod(i64 %a) alwaysinline
{
entry:
%return = sitofp i64 %a to double
ret double %return
}

define double @i32tod(i32 %a) alwaysinline
{
  %return = sitofp i32 %a to double
  ret double %return
}

define double @i16tod(i16 %a) alwaysinline
{
  %return = sitofp i16 %a to double
  ret double %return
}

define double @i8tod(i8 %a) alwaysinline
{
  %return = sitofp i8 %a to double
  ret double %return
}

define double @i1tod(i1 %a) alwaysinline
{
  %return = sitofp i1 %a to double
  ret double %return
}

define double @ui64tod(i64 %a) alwaysinline
{
entry:
%return = uitofp i64 %a to double
ret double %return
}

define double @ui32tod(i32 %a) alwaysinline
{
entry:
%return = uitofp i32 %a to double
ret double %return
}

define double @ui16tod(i16 %a) alwaysinline
{
entry:
%return = uitofp i16 %a to double
ret double %return
}

define double @ui8tod(i8 %a) alwaysinline
{
entry:
%return = uitofp i8 %a to double
ret double %return
}

define double @ui1tod(i1 %a) alwaysinline
{
entry:
%return = uitofp i1 %a to double
ret double %return
}

define i64 @ptrtoi64(i8* %a) alwaysinline
{
entry:
%return = ptrtoint i8* %a to i64
ret i64 %return
}

define i8* @i64toptr(i64 %a) alwaysinline
{
entry:
%return = inttoptr i64 %a to i8*
ret i8* %return
}

define i32 @ptrtoi32(i8* %a) alwaysinline
{
entry:
%return = ptrtoint i8* %a to i32
ret i32 %return
}

define i16 @ptrtoi16(i8* %a) alwaysinline
{
entry:
%return = ptrtoint i8* %a to i16
ret i16 %return
}

define i8* @i32toptr(i32 %a) alwaysinline
{
  %return = inttoptr i32 %a to i8*
  ret i8* %return
}

define i8* @i16toptr(i16 %a) alwaysinline
{
  %return = inttoptr i16 %a to i8*
  ret i8* %return
}

define double @fp80ptrtod(i8* %fp80ptr)
{
  %1 = alloca i8*, align 8
  store i8* %fp80ptr, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  %3 = bitcast i8* %2 to x86_fp80*
  %4 = load x86_fp80, x86_fp80* %3, align 16
  %5 = fptrunc x86_fp80 %4 to double
  ret double %5
}

;; scheme helpers

define i32 @is_type(i8* %ptr, i32 %val) alwaysinline
{
  %1 = bitcast i8* %ptr to i32*
  %2 = load i32, i32* %1
  %3 = and i32 %2, 15
  %set = icmp eq i32 %3, %val
  %res = zext i1 %set to i32
  ret i32 %res
}

define i32 @is_string(i8* %ptr) alwaysinline
{
  %res = call i32 @is_type(i8* %ptr, i32 1)
  ret i32 %res
}

define i32 @is_real(i8* %ptr) alwaysinline
{
  %res = call i32 @is_type(i8* %ptr, i32 2)
  ret i32 %res
}

define i32 @is_cptr(i8* %ptr) alwaysinline
{
  %res = call i32 @is_type(i8* %ptr, i32 15)
  ret i32 %res
}

define i32 @is_cptr_or_str(i8* %ptr) alwaysinline
{
  %v1 = call i32 @is_cptr(i8* %ptr)
  %v2 = call i32 @is_string(i8* %ptr)
  %res = or i32 %v1, %v2
  ret i32 %res
}

define void @llvm_zone_ptr_set_size(i8* %zone, i64 %size) nounwind alwaysinline
{
  %ptr = bitcast i8* %zone to i64*
  %size_ptr = getelementptr i64, i64* %ptr, i32 -1
  store i64 %size, i64* %size_ptr
  ret void
}

@TIME = external global i64 ; extemp::UNIV::TIME
define i64 @llvm_now() nounwind alwaysinline
{
  %res = load i64, i64* @TIME
  ret i64 %res
}

declare void @ascii_text_color_extern(i32 %bold, i32 %fg, i32 %bg)
define void @ascii_text_color(i32 %bold, i32 %fg, i32 %bg) nounwind alwaysinline "thunk"
{
  call void @ascii_text_color_extern(i32 %bold, i32 %fg, i32 %bg)
  ret void
}
