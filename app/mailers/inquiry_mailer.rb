class InquiryMailer < ApplicationMailer
	default from: "example@example.com"   # 送信元アドレス
  	default to: "toolingkanrisha@gmail.com"     # 送信先アドレス

#end_user側の送信時設定
  def received_email(inquiry)
  	@inquiry = inquiry
    #mail(to: 'toolingkanrisha@gmail.com', subject: 'レポート')
  end
end
