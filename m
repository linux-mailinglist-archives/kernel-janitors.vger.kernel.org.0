Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6088E1832EC
	for <lists+kernel-janitors@lfdr.de>; Thu, 12 Mar 2020 15:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgCLO0I (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 12 Mar 2020 10:26:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40682 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727340AbgCLO0I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 12 Mar 2020 10:26:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id f3so745868wrw.7
        for <kernel-janitors@vger.kernel.org>; Thu, 12 Mar 2020 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mran/SsFtCnhLMe88te8B5pjViLrFrhLBnL1J+NQyAQ=;
        b=n6o/1vazmKVd0JhI9n5ImHQjrTOPjoCP1UqJo1Oc61DcJUs9+3uf4dSbLtcev9basP
         CzN2bRt1m+tQu/pgVIjzqk8eGppzEomULwwr9lkYzK3790AbN9p8QXkk0GdzrU05FcW4
         OjIBe7J+jRR8eA81WIT+q/GEcz+rVVLeq+Hj2a2S1hwjTzFWmgzXYCFpFCABsxyxfN7V
         T5fbBXRg3X0+51IYEn0LMWLCDtnkmnVMPBjAmfZJTXiDOhAiETX8UErhfHXVBD0skffY
         1Ln9CWLeabdkpqs+HyDvz2lFtBlmABXZhekAJ8xeFZ/s3adfJba6DZV/IrFrnfpTy3He
         xumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mran/SsFtCnhLMe88te8B5pjViLrFrhLBnL1J+NQyAQ=;
        b=Q4lhCe/JSrL7dqGA17P6NmHPT+KvdqOxR9RfcFuMzJvGcMGeaVpDF8r+GGYQS1+5RC
         Qa7q2vvGFbO/lj9rBVQRoRoXqjZQ/ZJ8wg5vp0+MM0wAFaAlCEWK+NZ7dUngfFz8zI/3
         RgRs9HBYwcPJIi9kChAH/KOQp9guLZyRMpbUNQcdI0Go8GPGuq6PEETD3wodUHnbSuJU
         tTiIj0IxSUAf8whPZn6gDJx+zEBZF5XebTTfAy7nGST/slwtnRgZvntlKQx2zcEv3Flj
         cHhE7qCq8BwrOjTF10ryPGrS1gllFD+Ln+JCnsGt9nY8RqxCVMHZVYscSRA6/1UJOwtW
         nFNg==
X-Gm-Message-State: ANhLgQ2s1QP99XfzFFAElz6Aw0RhHeAUy446iGB5Td12JEhF9cLl14RE
        iB0v1sNU5Bg3uBUW8g0IZ6GbZijI4rYiQOqetNvUWg==
X-Google-Smtp-Source: ADFU+vuPb4lfUTKhpuKO6jLNj/1rsc2hVZhSeBBJVuHW3b9CdxlrbDf2pG80FVmy9+xL9+RFg6RpLt4xGyZ5+pCMLDk=
X-Received: by 2002:adf:c5c8:: with SMTP id v8mr6984934wrg.111.1584023164466;
 Thu, 12 Mar 2020 07:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200131045739.ault4d6yk2lqlbed@kili.mountain>
In-Reply-To: <20200131045739.ault4d6yk2lqlbed@kili.mountain>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 12 Mar 2020 10:25:52 -0400
Message-ID: <CADnq5_POLvoLi=1TprgH7jFn3TAJw37_P+1-VngxWtYTi1xmoA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Possible divide by zero in set_speed()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Lewis Huang <Lewis.Huang@amd.com>,
        Derek Lai <Derek.Lai@amd.com>,
        Charlene Liu <charlene.liu@amd.com>,
        Leo Li <sunpeng.li@amd.com>, Tony Cheng <Tony.Cheng@amd.com>,
        kernel-janitors@vger.kernel.org,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Jun Lei <Jun.Lei@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Thu, Jan 30, 2020 at 11:58 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> If "speed" is zero then we use it as a divisor to find "prescale".  It's
> better to move the check for zero to the very start of the function.
>
> Fixes: 9eeec26a1339 ("drm/amd/display: Refine i2c frequency calculating sequence")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
> index 066188ba7949..24adec407972 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_i2c_hw.c
> @@ -267,6 +267,9 @@ static void set_speed(
>         uint32_t xtal_ref_div = 0;
>         uint32_t prescale = 0;
>
> +       if (speed == 0)
> +               return;
> +
>         REG_GET(MICROSECOND_TIME_BASE_DIV, XTAL_REF_DIV, &xtal_ref_div);
>
>         if (xtal_ref_div == 0)
> @@ -274,17 +277,15 @@ static void set_speed(
>
>         prescale = ((dce_i2c_hw->reference_frequency * 2) / xtal_ref_div) / speed;
>
> -       if (speed) {
> -               if (dce_i2c_hw->masks->DC_I2C_DDC1_START_STOP_TIMING_CNTL)
> -                       REG_UPDATE_N(SPEED, 3,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_START_STOP_TIMING_CNTL), speed > 50 ? 2:1);
> -               else
> -                       REG_UPDATE_N(SPEED, 2,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> -                                    FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2);
> -       }
> +       if (dce_i2c_hw->masks->DC_I2C_DDC1_START_STOP_TIMING_CNTL)
> +               REG_UPDATE_N(SPEED, 3,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_START_STOP_TIMING_CNTL), speed > 50 ? 2:1);
> +       else
> +               REG_UPDATE_N(SPEED, 2,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_PRESCALE), prescale,
> +                            FN(DC_I2C_DDC1_SPEED, DC_I2C_DDC1_THRESHOLD), 2);
>  }
>
>  static bool setup_engine(
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
