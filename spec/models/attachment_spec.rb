# frozen_string_literal: true

require 'spec_helper'

describe Attachment do
  it { should belong_to :attachmentable }
end
