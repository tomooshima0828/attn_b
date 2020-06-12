module AttendancesHelper
# refactoring
  def attendance_state(attendance)
    if Date.current == attendance.worked_on
      return '出勤' if attendance.started_at.nil?
      return '退勤' if attendance.started_at.present? && attendance.finished_at.nil?
    end
    return false
  end
  
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
end

# refactored as above
# <% if (Date.current == day.worked_on) && day.started_at.nil? %>
#   <%= link_to "出勤登録", user_attendance_path(@user, day), method: :patch, class: "btn btn-primary btn-attendance" %>
# <% elsif (Date.current == day.worked_on) && day.started_at.present? day.finished_at.nil? %>
#   <%= link_to "退勤登録", user_attendance_path(@user, day), method: :patch, class: "btn btn-primary btn-attendance" %>
# <% end %>
