function onCreatePost()
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', i, 'visible', false)
    end

    if not middlescroll then
        setPropertyFromGroup('playerStrums', '0', 'x', 412)
        setPropertyFromGroup('playerStrums', '1', 'x', 524)
        setPropertyFromGroup('playerStrums', '2', 'x', 636)
        setPropertyFromGroup('playerStrums', '3', 'x', 748)
    end
end