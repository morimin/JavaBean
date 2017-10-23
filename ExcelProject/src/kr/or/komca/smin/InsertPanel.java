package kr.or.komca.smin;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.filechooser.FileNameExtensionFilter;

class InsertPanel extends JPanel implements ActionListener {


	private static final long serialVersionUID = 643979798520541952L;
	
	private FileInputStream inFile = null;
	private InputStreamReader inReader = null;
	private FileWriter fileWriter = null;
	private ArrayList<String> strList = new ArrayList<String>();
	private int b = 0;

	private JPanel northPanel;
	private JPanel displayPanel;
	private JPanel buttonPanel;
	// private JPanel footerPanel;

	private JTextArea display;
	private JTextField cutText;
	private JButton pathBtn;
	private JButton queryBtn;
	private JButton downBtn;
	// private JTextField copyRight;

	private JFileChooser jfc = new JFileChooser();
	private String setPath, downPath;

	public InsertPanel() {

		// this.setSize(900, 600);

		this.setLayout(new BorderLayout());

		// 2개의 panel 객체를 만들고 각자 layout 을 설정해보겠다.
		northPanel = new JPanel();
		displayPanel = new JPanel();
		buttonPanel = new JPanel();
		// footerPanel = new JPanel();

		northPanel.setLayout(new FlowLayout());
		displayPanel.setLayout(new FlowLayout());
		buttonPanel.setLayout(new FlowLayout());
		// footerPanel.setLayout(new FlowLayout());
		// buttonPanel.setLayout(new GridLayout(0, 4, 5, 5));

		/* cutting 관련 */
		cutText = new JTextField(10);
		buttonPanel.add(cutText);

		/* display 관련 */
		this.setLayout(new FlowLayout());
		display = new JTextArea(30, 70);
		display.setText("파일을 불러와주시기 바랍니다.");

		JScrollPane scroll = new JScrollPane(display);
		displayPanel.add(scroll);

		/* path button관련 */
		pathBtn = new JButton("불러오기");
		pathBtn.setSize(10, 70);
		pathBtn.addActionListener(this);

		northPanel.add(pathBtn);

		/* query button 관련 */
		queryBtn = new JButton("Query");
		queryBtn.setSize(10, 70);
		queryBtn.addActionListener(this);

		buttonPanel.add(queryBtn);

		/* download button 관련 */
		downBtn = new JButton("다운로드");
		downBtn.setSize(10, 70);
		downBtn.addActionListener(this);

		buttonPanel.add(downBtn);

		/* CopyRight */
		// copyRight = new JTextField();
		// copyRight.setText("테스트입니다.");
		//
		// footerPanel.add(copyRight);

		/* Add panel to frame */
		this.add(northPanel, BorderLayout.NORTH);
		this.add(displayPanel, BorderLayout.CENTER);
		this.add(buttonPanel, BorderLayout.SOUTH);
		// this.add(footerPanel, BorderLayout.BEFORE_FIRST_LINE);

		this.setVisible(true);

	}// dbTest()
	
	

	/* 동작 실행 처리 코드들 */
	@Override
	public void actionPerformed(ActionEvent e) {

		//
		/* 불러오기 버튼 실행부 처리 */
		//
		if (e.getSource() == pathBtn) {

			try {

				// 창을열고 버튼을 눌렸는지 확인하는 IF문
				if (jfc.showOpenDialog(this) == JFileChooser.APPROVE_OPTION) {

					setPath = jfc.getSelectedFile().toString();

				} else {

					display.setText(display.getText() + "\n" + "파일 불러오기를 취소했습니다.");

				} // if~else

				if (setPath != null) {

					display.setText(display.getText() + "\n" + "파일을 불러왔습니다.");

				}

			} catch (Exception ex) {

				display.setText(ex.getMessage());

			} // try~catch

		} // if_for_pathButton

		//
		/* Query버튼 실행부 처리 */
		//
		if (e.getSource() == queryBtn) {

			// display.setText("");

			if (setPath == null) {

				display.setText(display.getText() + "\n" + "데이터를 먼저 불러와주시기 바랍니다.");

			} else {

				try {

					display.setText("");

					inFile = new FileInputStream(setPath);

					// 불러온 값을 리스트에 담기
					while ((b = inFile.read()) != -1) {

						strList.add(Integer.toBinaryString(b));
						// strList.add(String.format("%02x", b));
						// System.out.printf("%02x ", b);

					} // while

					// 열 텍스트 null 일경우
					if (cutText.getText().equals("") == true) {

						// display에 텍스트가 없는경우
						if (display.getText() == null) {

							display.setText("");

							for (int i = 0; i <= strList.size() - 1; i++) {

								display.setText(display.getText() + strList.get(i));

							} // for

						} else {
							// display에 텍스트가 있는경우

							display.setText("");

							for (int i = 0; i <= strList.size() - 1; i++) {

								display.setText(display.getText() + strList.get(i));

							} // for

							display.setText(display.getText() + "\n" + "이진 데이터 수  = " + strList.size());

						} // if ~ else for

					} else if (cutText.getText().equals("0")) {

						display.setText("원하시는 열 개수를 다시 입력해 주시기 바랍니다.");

					} else {

						// display에 텍스트가 없는경우
						if (display.getText() == null) {

							display.setText("");

							int endInt = Integer.parseInt(cutText.getText());

							for (int i = 0; i <= strList.size() - 1; i++) {

								if (i != 0) {
									if ((i % endInt) == 0) {
										display.setText(display.getText() + "\n");
									}
								}

								display.setText(display.getText() + strList.get(i) + "\t");

							} // for

							// display.setText("");
							//
							// for (int i = 0; i <= strList.size() - 1; i++) {
							//
							// display.setText(display.getText() +
							// strList.get(i));
							//
							// } // for

						} else {
							// display에 텍스트가 있는경우

							display.setText("");

							int endInt = Integer.parseInt(cutText.getText());

							for (int i = 0; i <= strList.size() - 1; i++) {

								if (i != 0) {

									if ((i % endInt) == 0) {
										display.setText(display.getText() + "\n");
									}

								}

								display.setText(display.getText() + strList.get(i) + "\t");

							} // for

						} // if~else for display내용 유무

					} // if~else

				} catch (Exception ee) {

					display.setText("[DEBUG] :" + "\n" + ee.getStackTrace());

				} finally {

					try {

						if (inReader != null)
							inReader.close();
						if (inFile != null)
							inFile.close();
						strList.clear();

					} catch (Exception eee) {
						eee.getMessage();
					}

				} // try~catch

			} // if for setPath

		} // if

		//
		/* 다운로드 버튼 실행부 처리 */
		//

		if (e.getSource() == downBtn) {

			try {

				jfc.setFileFilter(new FileNameExtensionFilter("csv", "csv"));

				jfc.setMultiSelectionEnabled(false);

				// 창을열고 버튼을 눌렸는지 확인하는 IF문
				if (jfc.showSaveDialog(this) == JFileChooser.APPROVE_OPTION) {

					downPath = jfc.getSelectedFile().toString();

				} // if

				fileWriter = new FileWriter(downPath);

				// if(jfc.getFileFilter().getDescription().equals("csv")){
				// fileWriter.write(display.getText().replaceAll("\t", ","));
				// }else{
				// fileWriter.write(display.getText());
				//
				// }
				//
				switch (jfc.getFileFilter().getDescription()) {

				case "csv":
					fileWriter.write(display.getText().replaceAll("\t", ","));
					break;
				default:
					display.setText("확장자를 확인해 주시기 바랍니다.");
					break;

				}

				// fileWriter.write(display.getText());

				fileWriter.flush();

			} catch (Exception ex) {

				ex.getMessage();

			} finally {

				try {

					if (fileWriter != null)
						fileWriter.close();

				} catch (IOException ee) {
					// System.out.println(ee.getMessage());
					display.setText(
							"다운로드에 실패했습니다. = " + ee.getMessage() + "\n" + "다운로드에 실패했습니다. = " + ee.getStackTrace());

				} // IO try~catch

			} // try~catch

		} // if_for_downButton

	}// ActionListener

}// MAIN