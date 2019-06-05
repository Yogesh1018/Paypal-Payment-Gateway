module ApplicationHelper

  def get_checkout_path
    if params[:plan_id]
      plan = Plan.find(params[:plan_id])
      recuring_new_order_path(plan_id: plan.id, book_id: params[:book_id])
    else
      # express_new_order_path
      express_new_order_path(plan_id: params[:plan_id], book_id: params[:book_id])
    end
  end

end
  