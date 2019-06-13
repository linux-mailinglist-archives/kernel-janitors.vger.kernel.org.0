Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 701D343994
	for <lists+kernel-janitors@lfdr.de>; Thu, 13 Jun 2019 17:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732246AbfFMPOp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 13 Jun 2019 11:14:45 -0400
Received: from mail-yb1-f194.google.com ([209.85.219.194]:43045 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732244AbfFMN0m (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 Jun 2019 09:26:42 -0400
Received: by mail-yb1-f194.google.com with SMTP id n145so7815613ybg.10
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2019 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lMgV4ON/3RozpiQ6/NK+437FsBlCW7zS3QFn/Y7ng/M=;
        b=XNdld/NqaT0h+eu1VnkM1esDS/+J61cgoPovM2tRUsmDRSMUQTPncFPxkOwDih/1UH
         Sel1suCf9wRPiC3JwAVbEtfq5mLN0UB7TiH9xtKDoY4PyFLA/CZoOS3r3NLv/PA5zOKR
         dbRl5dL6BbijgNxnkR/MjOuWXnjnjVFa522g1TN9bXJOW/1sdn+9buY2RbKHW7vX8bO3
         CRRTMAitjAVlkZQO8mK4671g4Fn+J+8KmxAn+Nyra33HK4T27AgBxWuGTy638DZz+W65
         +DLPzsoVx5aTHBVGvzTens13dL6ihHWBgR5fLPPdLOPS0WqoTmYeTke+0LrCeAa6N2Aq
         IlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lMgV4ON/3RozpiQ6/NK+437FsBlCW7zS3QFn/Y7ng/M=;
        b=U2VwseeFqa+Ek+TwKGNZ6XCdlbDa4KgdSbiE0koP6rMZ+qgfyiCJaaiDIk3KkGU8mp
         xxUNpqNDCwPwk+Gxav7xB/T02Fyo5N3GAnvMiaGhk5ETmO0P9eBpkxEt+zF4ae3un13w
         D13OpQv7xCisw45f3W+JWTdQFtdP6ioq7hBYY9FbnlsZaBZq4xdh3nzw4c1kRMk/3Jxb
         8CMYKaOS5wFECNnE1mwGRhFvyPvBAlnr2foL/NjTJv0reUcF5MwU0gEPWVcMi5p2tffs
         euHVBCeKI4zraApRj9Sk+c7xUyo2/BO3DAISIMUAbBItAx2QDvoiiHzN/QMhGbVFExrK
         C7zw==
X-Gm-Message-State: APjAAAWSHgFZeTZAewuibQlFJZ0kDK6wHReqkWuLH6Uy2ZBtPYptJKTQ
        daqVhR6NJKury3armSOQu+ymbA==
X-Google-Smtp-Source: APXvYqy8vnOwRy6uzqjdzgDb07ztIWYsH+1alAVmpHMpTx7GpQ81mLlw6HKVL5+Ku2+gyoUpadJoWQ==
X-Received: by 2002:a25:e08:: with SMTP id 8mr4037668ybo.177.1560432401543;
        Thu, 13 Jun 2019 06:26:41 -0700 (PDT)
Received: from kudzu.us (76-230-155-4.lightspeed.rlghnc.sbcglobal.net. [76.230.155.4])
        by smtp.gmail.com with ESMTPSA id d63sm724375ywf.41.2019.06.13.06.26.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 06:26:41 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:26:39 -0400
From:   Jon Mason <jdmason@kudzu.us>
To:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] NTB: amd: Silence shift wrapping warning in
 amd_ntb_db_vector_mask()
Message-ID: <20190613132638.GD1572@kudzu.us>
References: <20190325092326.GE16023@kadam>
 <af8b8b48-ad5e-75c2-d3fe-674b14a0b9af@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af8b8b48-ad5e-75c2-d3fe-674b14a0b9af@amd.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Mar 26, 2019 at 05:46:44AM +0000, S-k, Shyam-sundar wrote:
> On 3/25/2019 2:53 PM, Dan Carpenter wrote:
> > This code triggers a Smatch warning:
> >
> >     drivers/ntb/hw/amd/ntb_hw_amd.c:336 amd_ntb_db_vector_mask()
> >     warn: should '(1 << db_vector)' be a 64 bit type?
> >
> > I don't think "db_vector" can be higher than 16 so this doesn't affect
> > runtime, but it's nice to silence the static checker warning and we
> > might increase "ndev->db_count" in the future.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Sorry for the delay.  The patch is now in the ntb branch.  We've
missed window for 5.2, but it will be in the 5.3 pull request.

Thanks,
Jon
