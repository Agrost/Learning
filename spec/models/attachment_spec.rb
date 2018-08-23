# frozen_string_literal: true

require 'spec_helper'

describe Attachment do
  it { is_expected.to belong_to :question }
end
