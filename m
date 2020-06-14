Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C563A1F88A2
	for <lists+kernel-janitors@lfdr.de>; Sun, 14 Jun 2020 13:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgFNLbb (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 14 Jun 2020 07:31:31 -0400
Received: from mout.web.de ([212.227.17.12]:37383 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726950AbgFNLb0 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Jun 2020 07:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592134272;
        bh=99e5fUmdAPxpyhSRJewC1/udHxWyON/Mb6axo3Pi7nw=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=RKUhYc0rWQnux02Ro1wBTLVZ620PnblMZuUuWhzu7KyGcMPzXoBahzGOYt9IN9HXG
         zMG2SQsNxuOiN/HwWo8U7yMwbQgZ6YPAWM6zqhDDvy/pma2JpMLdlws99KlcXYQM7q
         6JfGX+shsCiswN1PhQRiAPDsf+dkgyVAKkPmEh8E=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.103.145]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N7xeb-1ipDYK3zCl-014xYv; Sun, 14
 Jun 2020 13:31:12 +0200
Cc:     Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
        Stephen McCamant <smccaman@umn.edu>,
        Qiushi Wu <wu000273@umn.edu>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Rob Herring <robh@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: fix ref count leak in
 panfrost_job_hw_submit
From:   Markus Elfring <Markus.Elfring@web.de>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        dri-devel@lists.freedesktop.org
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <f99b8509-c2b9-e96a-3cb6-5e693afa138a@web.de>
Date:   Sun, 14 Jun 2020 13:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Pv8l/tQ9ungOKaqE7zOGU5a+YRAU1Ed5M+XWe+BxSHwbcZ0aiOs
 oPQBnkfxckklejUtugCVnOPGkz7HSO38w56J+Wi2MqqoGqC1Z6YvfbXv6aFVB6AUdV/DpgG
 iFWdZalMrxOelQttxfuMotFBZasV0jsy57PbHrACyM5aHx+T4kLmgBLoy5VbCNtxEBT/QaS
 9yvd1Yi5wc56xqbM3l7jQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HTs8QJXUewM=:jD8FDbRg3IX+u58po7lt/m
 AbqRwHbNp0h3XPfDHN6klHjUXksteIsOdDV6pt76+SnkIJ8QbkoTYEM153aGpWuKXWGW6OyDf
 JsK3xdbBhk2jbKDlThfilH2oA5PFOuNrzakDbzy4F9+4EZRQ7tg0gHaqmBRZGJSej2WuDen8G
 +6SgdbXWSUyKPTBrkQhtH1csVFxYP5XZ/FImd3+eyG4N/lF1Uut1GdIgGDHZU5Ob4Fl2FfgU+
 6p56ZQ1yjNtzdUIxmEvh8dYLU2Sj5O7WTGdIZvJtuYtq6h3E+CVKG7xv/8CmXFxWVl7SzEPzm
 s9yjX+OfMTPuUc2RNiy5buWFLw+dU9R6PDPAblJXSjrGOrMCkGYXf2+jEdooPviSkUfAvScM3
 XHPSNqLRsRwpUG+1iF5bgZdBWWtb2u+7/hzuozSuba+ClvQMMEGqeBIIWya+C+5BzQxfOBDIy
 7SRFTLzGYHF9Pq6pA7jWLxNB8yOkO2yYCoKScPB+Bq70f+zVdhVkik3eUJWGYaL9IJgO5+2yA
 Oaq169Z+kAA956mkgBCgC9fW6TWDYKKHN5mfyf8776Rr/ow/llH+F5lHHs8WV3v8v3/zcq70B
 lw9s0Kvr67aPmfTLfcSn8/xwQiIPYsrMeL+ci5cGxAriY8iEpEhVVrGhuW+NeDkFMzw9diEwf
 GYRnhgNEYHsBzU/hJsIRPNxNlTusnrDmyJpdISgAFDPoUDSBz7bP4NDDJn9UX+Iu4wU2mcIL2
 ZDBDA4gGmbTu3wKRMmj2HclITmQb1R5d/bAUJUzy3Jyl3tZpsuVKyuORk9aiQAqYSxz6r6bhq
 6vi0n9j+N6bFTp0YjJUBbmz8P9baM2i62DoR/uGDQx/6GKsQsk/7K0ZIXCaOOahUUldtR/twa
 BZONj17a4Bc6CbkfsbnDlegya2h/fMowA1+qicW0oFmZsfFslM7i8ESMKSaQirTbPT2UFeqtI
 Xugai9RyBt+CzUPzKBYlHKgfdj6X4nSHXrRvXjRFT1zfRIqZ8DNgnuUhI0czKqv+pSH1CRBsx
 tOtpPpQqNsPYK6VrX+mrcGvpR28YW7m3KQnKirL6lIC9ISkzB8u9fcaQQ4anQ+wjrdCDq4T6H
 biW2XjjUim/kA9cWZy/x5PYa2WA/ByIHW1zt4bEC8GXzNF0VXunhdQC/hLKx4QmiloUFBe3B/
 KDvpsa9Abrkc+j8jOIrlEEpufPCznj3UMe/AZ2EcGsXbQ8H3THgt4hP5X/DW2KhvFkyWmhKNg
 Csj76nfhhsZKhcn6N
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> in panfrost_job_hw_submit, =E2=80=A6

* Can the term =E2=80=9Creference count=E2=80=9D become relevant also for =
this commit message
  besides other possible adjustments?

* Would you like to add the tag =E2=80=9CFixes=E2=80=9D?


=E2=80=A6
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
=E2=80=A6
> @@ -184,6 +183,9 @@  static void panfrost_job_hw_submit(struct panfrost_=
job *job, int js)
>  				job, js, jc_head);
>
>  	job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
> +out:
> +	pm_runtime_put_sync_autosuspend(pfdev->dev);
> +	return;
>  }
=E2=80=A6

Perhaps use the label =E2=80=9Cput_sync=E2=80=9D instead?

Regards,
Markus
