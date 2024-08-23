function onCreate()
for i = 0, getProperty('unspawnNotes.length')-1 do
if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Note Invisible' then
setPropertyFromGroup('unspawnNotes',i,'noAnimation', true)
setPropertyFromGroup('unspawnNotes', i, 'visible', 0)
setPropertyFromGroup('unspawnNotes', i, 'lowPriority', true)
end
end
end