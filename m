Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC2BBA05D
	for <lists+kernel-janitors@lfdr.de>; Sun, 22 Sep 2019 05:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfIVDSr (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Sat, 21 Sep 2019 23:18:47 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45812 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727395AbfIVDSr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Sep 2019 23:18:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id 4so5958288pgm.12
        for <kernel-janitors@vger.kernel.org>; Sat, 21 Sep 2019 20:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=TFGjXXhKmjkAZP/tz+ArFN/SlKTThcfB37x7Td165fE=;
        b=uOa4XPmdMjEBXva+d+0v4ob182ddJrJVWcfSYiJ5oEr8CoojhpLY7lXAnOJWa4EnsL
         i7c/lJ6mWxzeZpsy/xLNKdUE5EQVOCiyo1Ues8Xri59h6IG+JRkjWTvQmKGQu3330slX
         EgZOraN56Jy75t2xbGqzfhpb+P3rlqUN+7HeBKnoUgTAwqRd77KhNgEm8Cwb7Dx11bDt
         n5HZhsporrJrpDiLqE0xb7N4x4AAVC3tGEzt5IE1NQVIiynG7m1ykH+4IVTYKIb1jiCr
         wytUqzTtWv8dqAoyq2nb4VNl9e3Tte4g/96gnMJp8PsCUuATXg71q+Z44waoulitkZO4
         DHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=TFGjXXhKmjkAZP/tz+ArFN/SlKTThcfB37x7Td165fE=;
        b=qYolnNiqSKfbyBOXu/z6ShhkKsbk6tgg2ZCp62QTPOG7XShftmNH7oIBLyNwEBFV0V
         5cF/mQU//JuvExMnv42HfIlDaWoPg+YJVAPUOk0y88PZmpmSzHg3dMCoBz3ZKtcWpcN+
         n9YNSZHr8DX+GoQUzmc6H1jrUdhROC+5yaCejpT+oe4s4a6OgIZ2kRwB6aBVN2DAD5zE
         k0ag1s2NdlPcDMrLZa9CjAIavhZpklqMUw2RtCJ+BxDSISDtWNd4PUgtghm+2AeVzobF
         xB1FsWzlEfG6ZIsbB6cjyB8mzw3r2a5VbrFhN7nVJ7K5AbxTktaViNkBcrymhUDbv1Xw
         uX9Q==
X-Gm-Message-State: APjAAAWRQL1Cp1yc9GnePBYuYOL5OguyARmXE6XP7cuika+NSd6jhkmt
        LaP9oUQlhcT84aPyO9f1LiVlQA==
X-Google-Smtp-Source: APXvYqxbBIkVgVFuicYvZV3pC7tph8zkTryWFhQebJpOhb1a4nS5KNsvCOsm8J3i//GSjmtAcRsV3g==
X-Received: by 2002:a65:6716:: with SMTP id u22mr22794378pgf.192.1569122326740;
        Sat, 21 Sep 2019 20:18:46 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net. [73.202.202.92])
        by smtp.gmail.com with ESMTPSA id o9sm10479549pfp.67.2019.09.21.20.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2019 20:18:46 -0700 (PDT)
Date:   Sat, 21 Sep 2019 20:18:43 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     aelior@marvell.com, GR-everest-linux-l2@marvell.com,
        davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] qede: qede_fp: simplify a bit 'qede_rx_build_skb()'
Message-ID: <20190921201843.12d21abf@cakuba.netronome.com>
In-Reply-To: <20190920045656.3725-1-christophe.jaillet@wanadoo.fr>
References: <20190920045656.3725-1-christophe.jaillet@wanadoo.fr>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 20 Sep 2019 06:56:56 +0200, Christophe JAILLET wrote:
> Use 'skb_put_data()' instead of rewritting it.
> This improves readability.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.
