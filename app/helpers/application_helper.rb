module ApplicationHelper
  def humanize secs
    [[60], [60, :minutos], [24, :horas], [1000, :dias]].map{ |count, name|
    if secs > 0
    secs, n = secs.divmod(count)
    "#{n.to_i} #{name}"
    end
    }.compact.reverse.join(' ')
  end
end
