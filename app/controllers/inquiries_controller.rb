class InquiriesController < ApplicationController
  def new
    # 入力画面を表示
    @inquiry = Inquiry.new
    #render :action => 'index'
  end

  def create
    # 入力値のチェック
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    if @inquiry.save
      # OK。確認画面を表示
      redirect_to inquiry_path(@inquiry)
    else
      # NG。入力画面を再表示
      render :action => 'new'
    end
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def thanks
    # メール送信
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.save
    InquiryMailer.received_email(@inquiry).deliver
    # 完了画面を表示
    render :action => 'thanks'
  end


  def admin_index
    #mail_flag:1の情報を持ってくる
  	@inquiry = Inquiry.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def admin_show
  	@inquiries = Inquiry.find(params[:id])
    @inquiry = Inquiry.new
  end

  private

  def inquiry_params
  	params.require(:inquiry).permit(:name, :email, :message)
  end

end