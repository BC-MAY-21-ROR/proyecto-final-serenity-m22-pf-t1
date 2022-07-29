# frozen_string_literal: true

# invoices
class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit update destroy]
 

  # GET /invoices or /invoices.json
  def index
    @invoices = Invoice.all
   
  end

  # GET /invoices/new
  def new
    @time_now = Time.new.strftime("%Y-%m-%dT%k:%M")
    @invoice = Invoice.new
    if params[:_query].present?
      @custom_data=search_by(params[:_query])
  end
  end

  # POST /invoices or /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoice_order_items_path(@invoice), notice: 'Invoice was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1 or /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoice_url(@invoice), notice: 'Invoice was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1 or /invoices/1.json
  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
    end
  end


  def search_by(_search)
      Customer.select(:id, :full_name, :dni).where("lower(full_name) LIKE ? OR dni LIKE ?","%"+ _search.downcase+"%", "%"+ _search+"%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def invoice_params
    params.require(:invoice).permit(:date, :amount, :customer_id)
  end
  def search_params
    params.require(:invoice).permit( :_query)
  end
end
