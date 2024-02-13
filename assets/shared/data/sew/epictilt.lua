leftTilt = true;
tilting = false;
loopF = 0;

function onBeatHit()
            -- add to loop timer
            loopF = loopF + 1;

                -- tilt to the right and stay tilting till tilting false again
            
            if leftTilt == true then
                if tilting == false then
                doTweenAngle('screenTilt', 'camGame', 0.5, 2, 'sineInOut');
                
                tilting = true;  
                end
                    if loopF >= 8 then
                        leftTilt = false;
                        loopF = 0;
                        tilting = false;
                    end
                
            end    
            
            -- tilt to the right and stay tilting till tilting false again
        
            if leftTilt == false then
                if tilting == false then
                doTweenAngle('screenTilt', 'camGame', -0.5, 2, 'sineInOut');
                tilting = true;  
                end
                    if loopF >= 8 then
                        leftTilt = true;
                        loopF = 0;
                        tilting = false;
                    end
                
            end
        end