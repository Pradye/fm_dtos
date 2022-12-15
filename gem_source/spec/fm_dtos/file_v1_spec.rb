require 'spec_helper'

describe FmDtos::FileV1 do
  let(:dto_file_v1) {FmDtos::FileV1.new}
  let(:file) do
    dto_file_v1.name = 'filename'
    dto_file_v1.original_filename = 'original'
    dto_file_v1.content_type = 'application/pdf'
    dto_file_v1.content = 'file content'
    dto_file_v1
  end

  describe 'content field' do

    context '#content' do
      subject{file.content}

      it{is_expected.to eq("ZmlsZSBjb250ZW50\n")}
    end

    context '#content_decoded' do
      subject{file.content_decoded}

      it{is_expected.to eq('file content')}
    end

    context '#read' do
      subject{file.read}
      it{is_expected.to eq('file content')}
    end
  end

  describe '#name' do
      subject{file.name}

      it{is_expected.to eq("filename")}
  end

  describe '#original_file_name' do
      subject{file.original_filename}

      it{is_expected.to eq("original")}
  end

  describe '#content_type' do
      subject{file.content_type}

      it{is_expected.to eq("application/pdf")}
  end
end