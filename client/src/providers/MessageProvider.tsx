import { message } from "antd";

const MessageProvider = () => {
  const [_messageApi, contextHolder] = message.useMessage();

  return <>{contextHolder}</>;
};

export default MessageProvider;
