;; A simple major mode for Open Shading Language based on C.

;; Author: Logan Kelly (logan.kelly@gmail.com)
;; Version: 1.0.0
;; Created: 14 June 2018

(setq osl-highlights
      (let* (
             ;; define several category of keywords
             (x-keywords '("and" "break" "continue" "do" "else" "emit" "for" "if" "illuminance" "illuminate" "not" "or" "output" "public" "return" "while"))
             (x-types '("int" "float" "color" "point" "vector" "normal" "matrix" "string" "void" "struct" "closure"))
	     (x-constants '("M_PI" "M_PI_2" "M_PI_4" "M_2_PI" "M_2PI" "M_4PI" "M_2_SQRTPI" "M_E" "M_LN2" "M_LN10" "M_LOG2E" "M_LOG10E" "M_SQRT2" "M_SQRT1_2"))
	     (x-events '())
	     (x-functions '("radians" "degrees" "cos" "sin" "tan" "sincos" "acos" "asin" "atan" "atan2" "cosh" "sinh" "tanh" "pow" "exp" "exp2" "expm1" "log" "log2" "log10" "logb" "sqrt" "inversesqrt" "hypot" "abs" "fabs" "sign" "floor" "ceil" "round" "trunc" "fmod" "mod" "min" "max" "clamp" "mix" "isnan" "isinf" "isfinite" "select" "erf" "erfc" "ptype" "dot" "cross" "length" "distance" "normalize" "faceforward" "reflect" "refract" "fresnel" "rotate" "transform" "transformu" "color" "luminance" "blackbody" "wavelength_color" "transformc" "matrix" "getmatrix" "determinant" "transpose" "step" "linearstep" "smoothstep" "smooth_linearstep" "noise" "pnoise" "snoise" "psnoise" "cellnoise" "hashnoise" "hash" "spline" "splineinverse" "Dx" "Dy" "Dz" "filterwidth" "area" "calculatenormal" "aastep" "displace" "bump" "printf" "format" "error" "warning" "fprintf" "concat" "strlen" "startswidth" "endswith" "stoi" "stof" "split" "substr" "getchar" "hash" "regex_search" "regex_match" "texture" "texture3d" "environment" "gettextureinfo" "pointcloud_search" "pointcloud_get" "pointcloud_write" "diffuse" "phong" "oren_nayar" "ward" "microfacet" "transparent" "translucent" "isotropic" "henyey_greenstein" "absorption" "emission" "background" "holdout" "debug" "getattribute" "setmessage" "getmessage" "surfacearea" "raytype" "backfacing" "isconnected" "isconstant" "dict_find" "dict_next" "dict_value" "trace" "arraylength" "exit"))

	     ;; generate refex string for each category of keywords
	     (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-types-regexp (regexp-opt x-types 'words))
             (x-constants-regexp (regexp-opt x-constants 'words))
             (x-events-regexp (regexp-opt x-events 'words))
             (x-functions-regexp (regexp-opt x-functions 'words))
	    )
        `(
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          (,x-events-regexp . font-lock-builtin-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
         )
       )
)

(define-derived-mode osl-mode c-mode "osl mode"
  "Major mode for editing OSL (Open Shading Language)."
  (setq font-lock-defaults '(osl-highlights))
)

(provide 'osl-mode)
