import { ConfigProvider, theme } from "antd";

const ThemeProvider = ({ children }: { children: React.ReactNode }) => {
  return (
    <ConfigProvider
      theme={{
        algorithm: theme.darkAlgorithm
      }}
    >
      {children}
    </ConfigProvider>
  );
};

export default ThemeProvider;
