class ParksController < ApplicationController
    before_action :set_park, only: [:show, :edit, :update, :destroy]
    require 'rest-client'
    require 'json'
    # GET /parks
    # GET /parks.json
    def index
        @parks = Park.all
        #get_json
    end

    def get_json
        url = 'http://data.tycg.gov.tw/TYCG_OPD/api/v1/rest/datastore/0daad6e6-0632-44f5-bd25-5e1de1e9146f;jsessionid=5251A4CFEE3E8993357074A495B31C91?format=json'
        response = RestClient.get(url)
        price_data = JSON.parse(response)
        # 以下為Json格式
        # p JSON.parse(response)
        # p price_data["parkName"]
        # price_data.each do |u|
        #Park.destroy_all
        price_data['result']['records'].each do |u|
            @park = Park.all
            @park.each do |park|
                if park.areaid == u['areaId'].to_s
                    p park.parkname
                    p u['parkName'].to_s
                    p u['surplusSpace'].to_s
                    park.surplusspace = u['surplusSpace'].to_s
                    park.updatetime = u['updatetime'].to_s
                    park.save
                #else
                #  Park.create(
                #      _id: u['_id'].to_s,
                #      parkid: u['parkId'].to_s,
                #      areaid: u['areaId'].to_s,
                #      areaname: u['areaName'].to_s,
                #      parkname: u['parkName'].to_s,
                #      introduction: u['introduction'].to_s,
                #      address: u['address'].to_s,
                #      totalspace: u['totalSpace'].to_s,
                #      surplusspace: u['surplusSpace'].to_s,
                #      payguide: u['payGuide'].to_s,
                #      updatetime: u['updatetime'].to_s,
                #      wgsx: u['wgsX'].to_s,
                #      wgsy: u['wgsY'].to_s
                #  )
                end
            end
        end
    end
    # if u["type"].to_s != nil
    # p u["_id"].to_s
    # end
    # a = Park.find_by_park_id(u['_id'])
    # p a
    # if a.nil?
    #    Park.create(
    #        _id: u['_id'].to_s,
    #        surplusspace: u['surplusSpace'].to_s,
    #        updatetime: u['updatetime'].to_s
    #    )

    # else
    #    Park.update(
    #        _id: u['_id'].to_s,
    #        surplusspace: u['surplusSpace'].to_s,
    #        updatetime: u['updatetime'].to_s
    #    )
    # end
    # crop_number: u["作物代號"],crop_name: u["作物名稱"],
    # market_name: u["市場代號"],market_number: u["市場名稱"],
    # on_price: u["上價"],the_price: u["中價"],by_price: u["下價"],
    # avg_price: u["平均價"],tranding_price: u["交易量"])

    # GET /parks/1
    # GET /parks/1.json
    def show
    end

    # GET /parks/new
    def new
        @park = Park.new
    end

    # GET /parks/1/edit
    def edit
    end

    # POST /parks
    # POST /parks.json
    def create
        @park = Park.new(park_params)

        respond_to do |format|
            if @park.save
                format.html { redirect_to @park, notice: 'Park was successfully created.' }
                format.json { render :show, status: :created, location: @park }
            else
                format.html { render :new }
                format.json { render json: @park.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /parks/1
    # PATCH/PUT /parks/1.json
    def update
        respond_to do |format|
            if @park.update(park_params)
                format.html { redirect_to @park, notice: 'Park was successfully updated.' }
                format.json { render :show, status: :ok, location: @park }
            else
                format.html { render :edit }
                format.json { render json: @park.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /parks/1
    # DELETE /parks/1.json
    def destroy
        @park.destroy
        respond_to do |format|
            format.html { redirect_to parks_url, notice: 'Park was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_park
        @park = Park.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def park_params
        params.fetch(:park, {})
    end
end
