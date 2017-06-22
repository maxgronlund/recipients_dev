require 'test_helper'

class MessageSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_subject = message_subjects(:one)
  end

  test "should get index" do
    get message_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_message_subject_url
    assert_response :success
  end

  test "should create message_subject" do
    assert_difference('MessageSubject.count') do
      post message_subjects_url, params: { message_subject: { messageble_id: @message_subject.messageble_id, messageble_type: @message_subject.messageble_type, organization_id: @message_subject.organization_id, title: @message_subject.title, user_id: @message_subject.user_id } }
    end

    assert_redirected_to message_subject_url(MessageSubject.last)
  end

  test "should show message_subject" do
    get message_subject_url(@message_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_subject_url(@message_subject)
    assert_response :success
  end

  test "should update message_subject" do
    patch message_subject_url(@message_subject), params: { message_subject: { messageble_id: @message_subject.messageble_id, messageble_type: @message_subject.messageble_type, organization_id: @message_subject.organization_id, title: @message_subject.title, user_id: @message_subject.user_id } }
    assert_redirected_to message_subject_url(@message_subject)
  end

  test "should destroy message_subject" do
    assert_difference('MessageSubject.count', -1) do
      delete message_subject_url(@message_subject)
    end

    assert_redirected_to message_subjects_url
  end
end
