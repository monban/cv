require 'rails_helper'

RSpec.shared_examples "an admin controller" do |model_factory|
  let(:model_object) { model_factory.call }
  context "when admin not logged in" do
    before(:example) { allow(subject).to receive(:admin?).and_return(false) }

    describe '#new' do
      before(:example) { get :new }
      it { expect(response.code).to eq('403') }
    end

    describe '#create' do
      before(:example) { post(:create, model_object.to_paramater_hash) }
      it { expect(response.code).to eq('403') }
    end

    describe '#edit' do
      before(:example) do
        model_object.save!
        get(:edit, id: model_object.to_param)
      end
      it { expect(response.code).to eq('403') }
    end

    describe '#update' do
      before(:example) do
        model_object.save!
        put(:update, {id: model_object.id, model_object.class.to_s => model_object.mutated_attributes})
      end
      it { expect(response.code).to eq('403') }
    end

    describe '#destroy' do
      before(:example) do
        model_object.save!
        delete(:destroy, {id: model_object.to_param})
      end
      it { expect(response.code).to eq('403') }
    end
  end

  context "when admin logged in" do
    before(:each) do
      allow(subject).to receive(:admin?).and_return(true)
    end
    describe '#new' do
      before(:example) { get :new }
      it { expect(response.code).to eq('200') }
    end

    describe '#create' do
      before(:example) { post(:create, model_object.to_paramater_hash) }
      it { expect(response).to redirect_to(resume_path) }
    end

    describe '#edit' do
      before(:example) do
        model_object.save!
        get :edit, id: model_object.id
      end
      #it { expect(assigns(:section)).to eq(section) }
      it { expect(response.code).to eq('200') }
    end

    describe '#destroy' do
      before(:example) do
        model_object.save!
        delete(:destroy, {id: model_object.to_param})
      end
      it { expect(response).to redirect_to(resume_path) }
    end
  end
end
