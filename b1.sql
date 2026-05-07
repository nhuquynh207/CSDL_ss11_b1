-- bảng và dữ liệu đã đc tạo ở b4
-- Đoạn mã nguồn hiện tại đang chạy trên Database
DELIMITER //
DROP PROCEDURE CancelAppointment;
CREATE PROCEDURE CancelAppointment(IN p_appointment_id INT)
BEGIN
--
UPDATE Appointments
SET status = 'Cancelled'
WHERE appointment_id = p_appointment_id AND status = 'Pending';
END //

DELIMITER ;

call CancelAppointment(1);
-- Thủ tục CancelAppointment hiện tại chỉ nhận vào ID và thực hiện lệnh UPDATE ngay lập tức mà không có điều khoản WHERE status = 'Pending'. 
-- Do đó, bất kể lịch khám đang ở trạng thái nào nó đều bị ghi đè thành "Đã hủy".
