"# DoAnCoSo" 
RegisterRoute.post('/create', (req,res,next) => {
    let acc_F_Name = req.body.acc_F_Name
    let acc_L_Name = req.body.acc_L_Name
    let acc_Account = req.body.acc_Account
    let acc_Password = req.body.acc_Password
    let acc_Email = req.body.acc_Email
    let acc_Birth = req.body.acc_Birth
    let acc_Phone = req.body.acc_Phone
    let acc_Role = req.body.acc_Role

    AccountModel.create({
        acc_F_Name   : acc_F_Name,
        acc_L_Name   : acc_L_Name,
        acc_Account  : acc_Account,
        acc_Password : acc_Password,
        acc_Email    : acc_Email,
        acc_Birth    : acc_Birth,
        acc_Phone    : acc_Phone,
        acc_Role     : acc_Role,
    })
    if (data =>{
        res.json('Tao Tai Khoan Thanh Cong');
    })
        res.status(500).json('Tao Tai Khoan That Bai')
    })


    /**
 * Create Acount 
 * @param {string} acc_F_Name
 * @param {string} acc_L_Name
 * @param {string} acc_Account
 * @param {string} acc_Password
 * @param {string} acc_Email
 * @param {Datetime} acc_Birth
 * @param {string} acc_Phone
 * @param {char} acc_Gender
 * @param {char} acc_Role
 */

async function create(acc_F_Name,acc_L_Name,acc_Account,acc_Password,acc_Email,acc_Birth,acc_Phone,acc_Gender,acc_Role){
    const pool = await getConnection();
    if (pool) {
        try {
            const result = await pool.query(`
            INSERT INTO Account (acc_F_Name,acc_L_Name,acc_Account,acc_Password,acc_Email,acc_Birth,acc_Phone,acc_Gender,acc_Role) 
            VALUES ('${acc_F_Name}', '${acc_L_Name}', '${acc_Account}', '${acc_Password}', '${acc_Email}', '${acc_Birth}', '${acc_Phone}', '${acc_Gender}', '${acc_Role}');
            `);
            pool.close();
            return result;
        } catch {err} {
            console.log(err);
            pool.close();
        return null;
        }
    }
        return null;
}

    tours_Name,loca_ID,tours_Date,tours_Day,tours_Pric,tours_Image_1 ,tours_Image_2,tours_Image_3 ,tours_Image_4 ,tours_Description

     bo_userName, bo_userEmail, acc_ID, tours_ID, bo_userPhone, bo_locaName, bo_checkInDate, bo_numberTourist, bo_note

     select tours_ID from tours where tours_Name = '{$tours_Name}';




<!-- booking section starts  -->

<div class="container booking" data-aos="zoom-out">

   <section class="flex" data-aos="zoom-in" data-aos-delay="600">

      <form action="booking/booking-new-tours" method="post">
         <h3>Booking Your Tour</h3>
         <p>Tên người đăng kí</p>
         <input type="text" name="bo_userName" required maxlength="50" placeholder="điền họ và tên" class="box">
         <p>Email</p>
         <input type="text" name="bo_userEmail" required maxlength="50" placeholder="Email của bạn" class="box">
         <p>Mã người dùng</p>
         <input type="number" name="acc_ID" required maxlength="50" placeholder="nhập mã người dùng" class="box">
         <div>
                <p>Chọn địa điểm</p>
                    <select name="tours_ID" id="tours_ID" class="box" required>
                        <option value="">Chose your Tours</option>
                        {{#each booking}}
                            <option value="{{tours_ID}}">{{tours_Name}}</option>
                        {{/each}}
                    </select>
         </div>
         <p>Chọn địa điểm</p>
         <input type="text" name="bo_location" required maxlength="50" placeholder="enter tour location" class="box">
         <p>Số điện thoại</p>
         <input type="text" name="bo_userPhone" required maxlength="50" placeholder="điền số điện thoại" class="box">
         <p>Chọn thời gian khởi hành</p>
         <input type="date" name="bo_checkInDate" class="box" required>
         <p>Số người đi</p>
         <input type="number" name="bo_numberTourist" min="1" max="10" maxlength="2" placeholder="number of guests" required class="box">
         <p>Ghi chú</p>
         <textarea name="bo_note" class="box" required maxlength="1000" cols="30" rows="10"></textarea>
         <input type="submit" value="book tour" name="search" class="btn">
      </form>

   </section>
</div>


.booking{
   background: url('/assets/media/images/booking-bg.jpg') no-repeat rgba(0,0,0,.5);
   background-position: center;
   background-attachment: fixed;
   background-size: cover;
   background-blend-mode: multiply;
}

.booking .flex{
   min-height: calc(100vh - 10rem);
   display: flex;
   align-items: center;
   justify-content: center;
}

.booking .flex form{
   background-color: var(--light-bg);
   border-radius: .5rem;
   padding: 2rem;
   width: 50rem;
   backdrop-filter: blur(.4rem);
}

.booking .flex form h3{
   font-size: 2.5rem;
   color: var(--white);
   padding-bottom: 1rem;
   text-align: center;
}

.booking .flex form p{
   padding-top: 1rem;
   font-size: 1.7rem;
   color: var(--light-white);
}

.booking .flex form .box{
   width: 100%;
   border-radius: .5rem;
   padding: 1.4rem;
   font-size: 1.8rem;
   color: var(--white);
   text-transform: none;
   background: var(--light-black);
   margin: 1rem 0;
}

.booking .flex form .box::placeholder{
   color: var(--light-white);
}
