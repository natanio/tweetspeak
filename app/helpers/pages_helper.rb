module PagesHelper

  def calculate_streak
   	now = current_user.current_sign_in_at.beginning_of_hour
   	last = current_user.last_sign_in_at.beginning_of_hour
    time_since_last_login = (now - last)/3600
    will_calculate = Time.now.to_i - current_user.last_calculated_streak.to_i

    if will_calculate > 86400 # one day in seconds
      	if time_since_last_login > 24 && time_since_last_login <= 48
        	current_user.streak += 1
        	current_user.last_calculated_streak = Time.now
        	if current_user.streak > current_user.best_streak
      			current_user.best_streak = current_user.streak
    		end
        	current_user.save
      	else
        	current_user.streak = 1
        	current_user.last_calculated_streak = Time.now
        	current_user.save
      end
    end
  end

  def streak_percent
    if current_user.streak != 0
      (current_user.streak * 100) / current_user.best_streak
    else
      return 0
    end
  end

  private

  def find_user_lessons
    ('A'..'Z').each do |i|
      puts '<h2 class="dictionary">#{i.capitalize}</h2>'
        current_user.user_courses.each do |course|
          (1..course.last_lesson).each do |id|
            lesson = Lesson.find(id)
            tags = lesson.tags.split(', ')

            tags.each_with_index do |tag, index|
              letter = tag[0].capitalize
              puts '<ul>
                <% if letter == i %>
                <li><a href="/lessons/<%= id %>/step/4"><%= tag %></a></li>
                <% end %>
              </ul>'

            end
          end
        end
      end
  end

end