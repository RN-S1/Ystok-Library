;;; -*- Mode: Lisp; Syntax: Common-Lisp; Base: 10; Encoding: (win32:code-page :id 1251) -*-
;;; Ystok Library - Russian-related functions and translations of hard-wired strings
;;; Copyright (c) 2003-2012 Dr. Dmitriy Ivanov. All rights reserved.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :ystok.library)

(defnative "Yes"	"��")
(defnative "No"		"���")
(defnative "Cancel"	"��������")
(defnative "Error"	"������")

(defnative "Illegal number format ~S~@[, char '~C'~]."
 #+Russian "������������ ������ ����� ~S~@[, ������ '~C'~].")

(let (#+lispworks (dspec:*redefinition-action* :quiet))

(defun ordinalize-tail (quantity &optional (gender t))
 ;;; Change the case of ordinal numeral
  ;; ������� ��������� ��� ����������� ������������� quantity � ������������ ������ ��.�.
  ;; �������� ����� �� ������� � ������?
  (declare (ignore quantity))
  (case gender
    (:male	"-�")
    (:female	"-�")
    (otherwise	"-�")) )

(defun transliterate-char (char &aux i)
 ;;; Value: character, string or nil
  ;; Q: Should we use Unicode names or Adobe glyph names?
  (cond ((setq i (char-position char "�����Ũ��������������������������������������"))
         (schar "ABVGDEEZIJKLMNOPRSTUFHYabvgdeezijklmnoprstufhy" i))
        ((setq i (char-position char "��������������������"))
         (svref #("ZH" "zh" "TS" "ts" "CH" "ch" "SH" "sh" "SCH" "sch"
                  "EE" "ee" "JU" "ju" "JA" "ja"
                  nil nil nil nil)		                     ;"ereversed"
                  ;"Hardsign" "hardsign" "Softsign" "softsign"
                i))
        (char)))
)