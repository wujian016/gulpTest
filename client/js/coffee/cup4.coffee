requiresclass = (captch) ->
 switch(captch)
  when 'caidi','sidid','wujian' then new wujian()
  when 'john' then new goodd()
  else throw new Error('Invalid captch')