function onStepHit()
    if not middlescroll then
        if curStep == 512 then
            noteTweenX("notebf", 4, 90, 0.5)
            noteTweenX("notebf1", 5, 205, 0.5)
            noteTweenX("notebf2", 6, 315, 0.5)
            noteTweenX("notebf3", 7, 425, 0.5)
        end
        
        if curStep == 896 or curStep == 2048 then
            noteTweenX("notebf", 4, 730, 0.5)
            noteTweenX("notebf1", 5, 845, 0.5)
            noteTweenX("notebf2", 6, 955, 0.5)
            noteTweenX("notebf3", 7, 1065, 0.5)
        end

        if curStep == 1660 then
            noteTweenX("notebf", 4, 412, 0.5)
            noteTweenX("notebf1", 5, 527, 0.5)
            noteTweenX("notebf2", 6, 643, 0.5)
            noteTweenX("notebf3", 7, 761, 0.5)
        end
    end
end