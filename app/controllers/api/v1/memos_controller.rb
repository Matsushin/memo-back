class Api::V1::MemosController < Api::V1::ApplicationController
  before_action :set_memo, only: %i[update show destroy]

  def index
    memos = Memo.order(created_at: :desc)
    render json: memos.to_json
  end

  def create
    memo = Memo.new(memo_params)

    if memo.save
      render json: memo.to_json
    else
      render json: { errors: memo.errors.full_messages }
    end
  end

  def update
    if @memo.update(memo_params)
      render json: @memo.to_json
    else
      render json: { errors: @memo.errors.full_messages }
    end
  end

  def show
    render json: @memo.to_json
  end

  def destroy
    if @memo.destroy
      render json: @memo.to_json
    else
      render json: { errors: @memo.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

  def set_memo
    @memo = Memo.find(params[:id])
  end

  def memo_params
    params.require(:memo).permit(:title, :body)
  end
end