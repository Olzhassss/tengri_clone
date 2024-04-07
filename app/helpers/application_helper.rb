module ApplicationHelper
    def format_datetime(datetime)
        datetime = datetime + 5.hours
        if datetime.to_date == (DateTime.now - 24.hours).to_date
            datetime.strftime("Вчера %H:%M:%S")
        elsif datetime.to_date == DateTime.now.to_date 
            datetime.strftime("Сегодня %H:%M:%S")
        else
            datetime.strftime("%d %B %Y %H:%M:%S")
        end
    end
end
