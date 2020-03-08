Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EDCC17D6C2
	for <lists+kernel-janitors@lfdr.de>; Sun,  8 Mar 2020 23:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgCHWcr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sun, 8 Mar 2020 18:32:47 -0400
Received: from mail-yw1-f67.google.com ([209.85.161.67]:38802 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbgCHWcr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 Mar 2020 18:32:47 -0400
Received: by mail-yw1-f67.google.com with SMTP id 10so8345540ywv.5
        for <kernel-janitors@vger.kernel.org>; Sun, 08 Mar 2020 15:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1XiIHjbFXRu9GcpXHs973G3osab43809kvN7/VuRkTY=;
        b=molc4fTTx3EfNQFKqa2kGZbynhI0XqbMtvU3KV/NnQYHLWP3KSAfZxKeGAf94F+czz
         WQ1J6XiWfxc6DHDUwdDizKyFCOlmf8xFJ+aNZnTY0qVTUFnu2seFDXR6Y7fWVTZHU+QC
         DfvvUTIaFfGCbWiqBais34Qzfthsy+xqafc5SYH9Kt/jqtWQA72Hs/EXA1zlH+fbTFr9
         INOTuFkuhE/yFrIr/T3XGsGGGOPPMUbuXKLCytRfNUW2HH+utuS3s1sdARIs3szpQ809
         3vLhCYJhBEkXXPv5PtkUjt912ld3d2zP1bUoz0QlWaxSuavUQ0E7LL1GB+EbzT48E/JY
         tlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1XiIHjbFXRu9GcpXHs973G3osab43809kvN7/VuRkTY=;
        b=oE5vJACw+NKIqqTvBvekT3n4enur81bgbt29pQYmR1azrialuHjUBZ+ByZ144pcXBP
         cATVNV18BmbLqv26ncDdGmGctHtYQGGQlg9tWxzoqP8OrG1wq3vz0TOvZhSVM3DL9cdj
         tS6ROXEKbkeZxtJyl0bjoNa38wBe6BBBSEzROOwJIPa3LdpqLNVtZHkI0VtHoTzcu3wu
         kWF1C5qWV4EeAlcsYIPbE5giRu+lV/71nsPOLy0v1cDKO43dveSv/8khtc2chDnVPKV5
         ZENYDQmM+LJpqNxvpwUKj/r5PgdA5Vd10sOk2Wcs6R0i5Ch6CQGkfNf9T2UJxymwBXyQ
         LhNw==
X-Gm-Message-State: ANhLgQ1YQUbjQ2eBBEapkTHSUcJjTQ3gxeNk0wJD+MILgq0QXtWr7/uq
        wSl04u63cTAi2NrPj152MOlPBB5X1DJVJPnbm49/uA==
X-Google-Smtp-Source: ADFU+vtxmx0EG4Cfm3oOUDllyASyoOmKq37AYtRDE8dVdXlGvQv7BYpHkU2WzolcnOtFY2aPYOfFjkzpWOGvEjaaFDU=
X-Received: by 2002:a25:3255:: with SMTP id y82mr14227923yby.208.1583706765900;
 Sun, 08 Mar 2020 15:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Sun, 8 Mar 2020 15:32:35 -0700
Message-ID: <CABXOdTcrxoBCz24Ap=YJYZnr+oLAmaR10xZ9ar2mYbE1=RAoug@mail.gmail.com>
Subject: Re: [PATCH RFC] MAINTAINERS: include GOOGLE FIRMWARE entry
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, Mar 8, 2020 at 12:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> All files in drivers/firmware/google/ are identified as part of THE REST
> according to MAINTAINERS, but they are really maintained by others.
>
> Add a basic entry for drivers/firmware/google/ based on a simple statistics
> on tags of commits in that directory:
>
>   $ git log drivers/firmware/google/ | grep '\-by:' \
>       | sort | uniq -c | sort -nr
>      62     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>      13     Reviewed-by: Guenter Roeck <groeck@chromium.org>
>      12     Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>      11     Reviewed-by: Julius Werner <jwerner@chromium.org>
>
> There is no specific mailing list for this driver, based on observations
> on the patch emails, and the git history suggests the driver is maintained.
>
> This was identified with a small script that finds all files belonging to
> THE REST according to the current MAINTAINERS file, and I investigated
> upon its output.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a0f8115c92c..ed788804daab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7111,6 +7111,14 @@ S:       Supported
>  F:     Documentation/networking/device_drivers/google/gve.rst
>  F:     drivers/net/ethernet/google
>
> +GOOGLE FIRMWARE
> +M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> +M:     Stephen Boyd <swboyd@chromium.org>
> +R:     Guenter Roeck <groeck@chromium.org>
> +R:     Julius Werner <jwerner@chromium.org>
> +S:     Maintained
> +F:     drivers/firmware/google/
> +

FWIW, I would not mind stepping up as maintainer if needed, but I
think we should strongly discourage this kind of auto-assignment of
maintainers and/or reviewers.

Guenter

>  GPD POCKET FAN DRIVER
>  M:     Hans de Goede <hdegoede@redhat.com>
>  L:     platform-driver-x86@vger.kernel.org
> --
> 2.17.1
>
