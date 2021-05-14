# -*- coding: utf-8 -*-
"""
Created on Mon Jub  6 13:44:08 2020

@author: Sokratis Athanasiadis
"""

import ply.lex as lex
import ply.yacc as yacc
import sys


#tokens 

tokens = [
    'INT',
    'FLOAT',
    'NAME',
    'PLUS',
    'MINUS',
    'DIVIDE',
    'MUL',
    'EQUALS'  
    'RBRAC'
    'LBRAC'
    ]

t_PLUS = r'\+'
t_MINUS = r'\-'
t_MUL = r'\*'
t_DIVIDE = r'\/'
t_EQUALS = r'\='

t_ignore = r' ' #to ignore spaces

def t_FLOAT(t):
    r'\d+\.\d+' #means it is any integer followed by a dot (.) followed by any integers
                #1.3123 1312.3415 ....
    t.value = float(t.value)
    return t

def t_INT(t):
    r'\d+' #any chars whose length is more than one
            #1, 1201930102 ...
    t.value = int(t.value) #convert string to int
    return t

def t_NAME(t):
    r'[a-zA-Z_][a-zA-Z_0-9]*' #first char can't be a number
    t.type = 'NAME'
    return t

def t_error(t):
    print('Illegal characters!')
    t.lexer.skip(1)
    
#build lexer
lexer = lex.lex()
'''
lexer.input("26=213 ")

while True:
    tok = lexer.token()
    if not tok:
        break
    print(tok)

'''
precedence = (
    #left associative tokens
    #devide and multiply have higher precedence than plus and minus
    
    ('left', 'PLUS', 'MINUS'),
    ('left', 'MUL', 'DIVIDE')
    
)

def p_program(p):
    '''
    program : lbrac comp_stmt rbrac
    '''
    p[0] = ('=', p[1], p[3])
def comp_stmt(p) :
    '''
    compt_stmt : lbrac stmt_list rbrac
    '''


def p_calc(p):
    '''
    calc : expression
         | var_assign
         | empty
    '''
    print((p[1]))
    
    
    
def p_var_assign(p):
    '''
    var_assign : NAME EQUALS expression
    '''
    p[0] = ('=', p[1], p[3])

def p_expression(p):
    '''
    expression : expression MUL expression
               | expression DIVIDE expression
               | expression PLUS expression
               | expression MINUS expression
    '''
    p[0] = (p[2], p[1], p[3])
    #1+2+4
    
def p_expression_int_float(p):
    '''
    expression : INT
               | FLOAT
    '''
    p[0] = p[1]
    
def p_expression_var(p):
    '''
    expression : NAME
    '''
    p[0] = ( 'var', p[1])

def p_error(p):
    print('Syntax error!')

def p_empty(p):
    '''
    empty :
    '''
    p[0] = None
    

parser = yacc.yacc()

            


while True:
    try:
        s = input('>> ')
    except EOFError:
        break
    parser.parse(s)