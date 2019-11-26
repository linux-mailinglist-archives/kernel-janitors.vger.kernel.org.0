Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10F29109E20
	for <lists+kernel-janitors@lfdr.de>; Tue, 26 Nov 2019 13:39:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfKZMje (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 26 Nov 2019 07:39:34 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57981 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725911AbfKZMje (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Nov 2019 07:39:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574771972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2VadMJ/aSgwHbJpMFCv+DTeYpcUUQbzgSGAFUkGztGI=;
        b=I+n1a04PDquNnhrGADsS0lR/W+tTsiwGsngBdVd2zoihx0W50qxQ0p/yjwfdHkkKXJoj4P
        06bd2gY6PCAdzlAaMBrc9LUrmB7IPHIt42Xd5MdNJaaeAB40SyhK+itcmf7HsRHnZpRUoz
        WdFcFNlkxmbQmhoJenBreg40EF7dZzg=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-JAaqZP7uO-yxThQJn2dOPg-1; Tue, 26 Nov 2019 07:39:31 -0500
Received: by mail-lj1-f198.google.com with SMTP id l12so3689581ljg.21
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Nov 2019 04:39:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version:content-transfer-encoding;
        bh=2VadMJ/aSgwHbJpMFCv+DTeYpcUUQbzgSGAFUkGztGI=;
        b=O+XRocRLliJygmrSUNKyUhDMMsOUDcE1FzvT40EeXbES3q1D/mD1Hmy4aH9L9as2UZ
         aikAsM+69AsvBj2JHgS5sbRZMN5/b3oE3R4RaM4dPFtPJ1j5zbt/z8vO90EMRcO5RNuW
         9OYppa0tmdNRCcFvxzSS48+D8qteU8sHh6D5a3kbx5QY44YBpZ5H+WSTwjb+0PVFeGAI
         By3JVFXYrE0Kxma988g+F/OVx+bzO5BaG+wmrJ7AxAM6yuyRsiO1jnAs8x27o/fQUIBp
         B2mzDRfKtzELz/5YwYibfd060PLsYCRh8flaerNdxrUZk+VQXUQOdeEVXEWdy0nJ2ItC
         NtSA==
X-Gm-Message-State: APjAAAV/S91v77tnSXX3pq8KSkOoTpCWKqQrlsxRZ/VM/gvqx43+4b+/
        /Yh3de8Php60JrH5bpX3tY6Rnb0R8PZFXHsQJhIpNzpy4Anrl4BqvzCUKhxDLcDkXDpjtPvTnjy
        t2QXf0PHOXZrrzPBBRtPR54FBIAWd
X-Received: by 2002:ac2:4102:: with SMTP id b2mr25034840lfi.16.1574771969861;
        Tue, 26 Nov 2019 04:39:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqwMUX4nVqQ+FMTokq7ORlBMBeiqIzP7BUvwDeFyDsu8c8xnsq1l+pQCS86d53A3EOuT0b0huQ==
X-Received: by 2002:ac2:4102:: with SMTP id b2mr25034833lfi.16.1574771969730;
        Tue, 26 Nov 2019 04:39:29 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id d4sm5140763lfi.32.2019.11.26.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 04:39:29 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 65E451818BF; Tue, 26 Nov 2019 13:39:28 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc:     linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Roy Luo <royluo@google.com>, Kalle Valo <kvalo@codeaurora.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mac80211: airtime: Fix an off by one in ieee80211_calc_rx_airtime()
In-Reply-To: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
References: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Tue, 26 Nov 2019 13:39:28 +0100
Message-ID: <87wobmyfpb.fsf@toke.dk>
MIME-Version: 1.0
X-MC-Unique: JAaqZP7uO-yxThQJn2dOPg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> This code was copied from mt76 and inherited an off by one bug from
> there.  The > should be >=3D so that we don't read one element beyond
> the end of the array.
>
> Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76=
")
> Reported-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Thanks!

Acked-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

