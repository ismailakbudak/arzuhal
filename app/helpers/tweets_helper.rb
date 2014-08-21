module TweetsHelper

   def wrap(text, line_width = 20 ) 
        truncate(text, length: 45, omission: '... (continued)')
   end

end
