Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF8077D608
	for <lists+kernel-janitors@lfdr.de>; Thu,  1 Aug 2019 09:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbfHAHHr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 1 Aug 2019 03:07:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51099 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728217AbfHAHHr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Aug 2019 03:07:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id v15so63428817wml.0
        for <kernel-janitors@vger.kernel.org>; Thu, 01 Aug 2019 00:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0zKS+bHOSYnyT32IPvAXO9rhh7LcLf3miOYkXJWe5L4=;
        b=dWrBmkFn3vVe7tzKRYyjOAhP9iOvoPwRcJ+f1L9bjQCjHEQT/Gcm6d1goQk1rH4SoB
         Mm3i/w296UYLfpg2VEljZ7JynmeDSON5gpNNeQo9akA6QBdvdndiPje4wRZeW6sknNVt
         3s7euiDANySVHdZRFoqvvXP58bLXAeM8ne+hOaui4UNrTznEwH7KC+Z1Fym9RmNaXOiT
         kmaUtkCmujuOBn99xFoqS6QeKbTgoFxg2FjFjkzIUC8uArAtMZshVkdwp0PAGmRZRWoL
         ygoLCV3MJGPbn1nKJD1m3gDBWXw126bKtoqaIEboV58sKqae675+raNZY2ZVnENOHSgA
         XrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0zKS+bHOSYnyT32IPvAXO9rhh7LcLf3miOYkXJWe5L4=;
        b=atXTH4WLMgmwO/EyEGKjmxfFOevosopalrSNK9d41XIrXbRoCPMrfafDttfaTcja78
         vGVnrRXSwKIqFj6f0xZGrvNsssyZAeiiVs8PeLxS26WRojf6iTMl+psXnNlFcA0eBoE+
         CVW3VpaRhTgiclZfCUADaedUMUOyi0o3yTjN9lsaABWsqyg8KausTgyKGbieHr16Ijey
         ysaGjgc6klS5MkfP7c9y+9wRh67aHidoMa77PLXjDrS1cSEjJ71CbcJCDJUmOJP1aR2Q
         h/5jvZ0xuYgdIeyRHoBqTDyF2vY0EOacI825OR+AXPCu3Df2jf1cE2cRIW0cW5wF3Ayk
         r5Cw==
X-Gm-Message-State: APjAAAX+FQMnM4CLQFoCf4Cpxz1nj/trr/p/uhtWeoVwOnR/3oGPOGlu
        o5BFNJdX2IQyNEJiWPkAQR7mWHNjkjhLMH7Zh62bDg==
X-Google-Smtp-Source: APXvYqxn8QMZyUJF1yqlNdxeuz9kgUitutcq7yzpiuVeQyEV/36zZBJj76nPfArr7DZ9GPlU2VJmM3gn88wCcDp4qGA=
X-Received: by 2002:a05:600c:2146:: with SMTP id v6mr12874903wml.59.1564643265374;
 Thu, 01 Aug 2019 00:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190731222214.15720-1-colin.king@canonical.com>
In-Reply-To: <20190731222214.15720-1-colin.king@canonical.com>
From:   Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date:   Thu, 1 Aug 2019 09:07:33 +0200
Message-ID: <CAMGffEnQ7oRebm9QNKQUcx+MQan1tgQWw6R=O081qbm1kKSw9w@mail.gmail.com>
Subject: Re: [PATCH] scsi: pm80xx: remove redundant assignments to variable rc
To:     Colin King <colin.king@canonical.com>
Cc:     "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Aug 1, 2019 at 12:22 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are several occasions where variable rc is being initialized
> with a value that is never read and error is being re-assigned a
> little later on.  Clean up the code by removing rc entirely and
> just returning the return value from the call to pm8001_issue_ssp_tmf
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks, Colin.
