Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B499911A21
	for <lists+kernel-janitors@lfdr.de>; Thu,  2 May 2019 15:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbfEBN1R (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 2 May 2019 09:27:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41592 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfEBN1R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 May 2019 09:27:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id c12so3362223wrt.8
        for <kernel-janitors@vger.kernel.org>; Thu, 02 May 2019 06:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=klk9BfNLobZFzvvv3RWonkuC3y07XDsJxgsitF+PBMI=;
        b=qOHmcqy3EHCK6AexNbRileaCwlwx3/PzRurQef2yZJYqR7iFJ9DsBq+c6DBfM5KWYu
         Q1GyZUkSmOmICclqCtB3BR+qAfzqBvbRj3tD/LATwhtklPPdLYp5ytsmHeQeiBbszzj8
         ZdRrXzNEI3jqMcuOoLua/OlpTZMoIygtCHiZxyJABWbvoJ8+FkloKhcYv/MBSbCHvkp3
         BOyYCOMiwtTIf5wOsdOeSdt11F6Up3K9ncC9mKVXzZNUNSj0jA/esk2Zp/JQ2SITBwWq
         OqgR4+DxSfi4R3hpGT2jLQYEDgenqMNeaB/SVbp/mNrXEsmF2iLTOHHvN2sCOrvrwpCW
         guVw==
X-Gm-Message-State: APjAAAX8yYJQKGQMeiQ4XdNI0yPmHBgpA6Kf+UkJfW+KTWdgL6Ppl3/R
        PVjGPLzCI8zHMWWB357VOJnsrTmh5l5R8sYLRtTrZA==
X-Google-Smtp-Source: APXvYqzwqgHiTGnc/CUv5ctBzIs+Lutqt2xj3BHihx/LSigv+LRUxs2dNE20e+3GgBpSacsfbpEzd2l4Oe6+XZAb8TE=
X-Received: by 2002:a5d:548d:: with SMTP id h13mr2948846wrv.218.1556803636210;
 Thu, 02 May 2019 06:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190501125717.5695-1-colin.king@canonical.com>
In-Reply-To: <20190501125717.5695-1-colin.king@canonical.com>
From:   Bryan Gurney <bgurney@redhat.com>
Date:   Thu, 2 May 2019 09:27:05 -0400
Message-ID: <CAHhmqcTRVWBNnynaAJ7mbtke-MCiBma-6z_=bYrFzh0ubky-Fw@mail.gmail.com>
Subject: Re: [PATCH][next] dm: remove redundant unsigned comparison to less
 than zero
To:     Colin King <colin.king@canonical.com>
Cc:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 1, 2019 at 8:58 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable block is an unsigned long long hence the less than zero
> comparison is always false, hence it is redundant and can be removed.
>
> Addresses-Coverity: ("Unsigned compared against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/md/dm-dust.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> index 178587bdc626..e739092bfc65 100644
> --- a/drivers/md/dm-dust.c
> +++ b/drivers/md/dm-dust.c
> @@ -411,7 +411,7 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>
>                 block = tmp;
>                 sector_div(size, dd->sect_per_block);
> -               if (block > size || block < 0) {
> +               if (block > size) {
>                         DMERR("selected block value out of range");
>                         return result;
>                 }
> --
> 2.20.1
>

Thanks.

There was already a check before that to ensure that the argument
feeding this variable is an unsigned long long; if it isn't, it will
fail with EINVAL:

# dmsetup message -- dust1 0 queryblock -1
device-mapper: message ioctl on dust1  failed: Invalid argument
Command failed

Reviewed-by: Bryan Gurney <bgurney@redhat.com>
