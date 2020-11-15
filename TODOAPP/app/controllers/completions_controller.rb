class CompletionsController < ApplicationController
  before_action :check_login
  before_action :check_user_completion , {only:[:return, :show, :delete]}

  def index
    @completions = Completion.where(user_id:@current_user.id).order(created_at: :desc)
  end

  def complete
    post = Post.find_by(id:params[:id])
    comp = Completion.create(content: post.content, deadline: post.deadline, starttime: post.created_at, user_id: post.user_id)
    comp.save
    post.delete
    flash[:notice] = "タスクを完了しました"
    redirect_to("/completions/index")
  end

  def show
    @completion = Completion.find_by(id: params[:id])
    workingHour = (@completion.created_at - @completion.starttime).to_i
    day = workingHour/60/60/24
    @workingHour = Time.at(workingHour).utc.strftime("#{day}日 %-H時間 %-M分")
    if @completion.deadline
      timeFromDeadline = (@completion.deadline - @completion.created_at).to_i
      if timeFromDeadline < 0
        timeFromDeadlineDay = -timeFromDeadline/60/60/24
        @timeFromDeadline = Time.at(-(timeFromDeadline)).utc.strftime("から#{timeFromDeadlineDay}日 %-H時間 %-M分 超過")
      elsif timeFromDeadline > 0
        timeFromDeadlineDay = timeFromDeadline/60/60/24
        @timeFromDeadline = Time.at(timeFromDeadline).utc.strftime("より#{timeFromDeadlineDay}日 %-H時間 %-M分 早い")
      end
    end
  end

  def delete
    completion = Completion.find_by(id:params[:id])
    completion.delete
    flash[:notice] = "投稿を削除しました"
    redirect_to("/completions/index")
  end

  def return
    completion = Completion.find_by(id:params[:id])
    post = Post.create(content: completion.content, deadline: completion.deadline, created_at: completion.starttime, user_id: completion.user_id)
    post.save
    completion.delete
    flash[:notice] = "タスクを未完了に戻しました"
    redirect_to("/posts/#{post.id}")
  end
end
