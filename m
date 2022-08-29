Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF14E5A46F3
	for <lists+kernel-janitors@lfdr.de>; Mon, 29 Aug 2022 12:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiH2KQX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 29 Aug 2022 06:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiH2KQH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 29 Aug 2022 06:16:07 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1BF60696
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Aug 2022 03:15:39 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id bh13so7280626pgb.4
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Aug 2022 03:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=d/n+KGxTJBr3Hg4cGN8oNc3cyaAF1OrmAktrk5JJXfQ=;
        b=nkatcHtNu5bDzQ4CDckSYFFCZnLXujn44lPCVt0pZW4neP1RoCQQLJvFVYRHcrwzTa
         YGOsD8aQfX/q8sjvM3UOd54HZjsM4wDu+kUgIrcn4W0dowcQNeNWPeOMO3i85SLQvLil
         /jnWdcPvBP097Awh0p9T+l7L9XQQ0Mqytjx05uE6g21Q2kz0KvKk9H18SEzQi8mbu2f7
         cDxrNcdKkT5qu7z29U+pSmyxcLZGi1q33cCPaHSiEAr2SI80LFFK86UyMMuvOxV4gaVL
         3Zx4bcwscMPQN6vM4kcvrtpa8H2DGekeI8rWvthFZf82DvNFKfOR76EhBqwzO/5c8Slr
         eZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d/n+KGxTJBr3Hg4cGN8oNc3cyaAF1OrmAktrk5JJXfQ=;
        b=i6DJgtE5j8SZKFhWVklJNeXFFTn2jS9geYIznzqvuxOOyuApIvO6M2Z39oDadCCPzH
         TkGmTzKBxP5rLjzXtzcH/s6OktfE7mirUISEpQqqe0OUPYgIYdGyUiWvVzzZ80t1y/ia
         yT7oJ3q74txD7qdKioCN6MPzO581zGhvHYc1aCtKQm3hxkKscwMZu9NFVEla0JwvKGLh
         JRiKtjSrzOdR2oo2lhxcQumUygF6DXJ+E2TMjeCmDk1yT7BsPn8LCZ25gvgZ+QiAL0Aw
         6c0PMSIJBrT1IYEKz+8pjtES6giqi/3xELWcii6OrVwlFdcfNAAzhaB918gx67HhHyYo
         /eKQ==
X-Gm-Message-State: ACgBeo3wiPpZuvonKLbk8Nv5mdguSuVnJLaa6inev7xJMjZuYtM55RDZ
        Via0mpqfrP4rmgSdpp8rAqsnt00Rk1lMNwEm/SM=
X-Google-Smtp-Source: AA6agR6r/HKPvMcckcvtYGShB4Q/HVQ7WB1OepZsvjIPZRzA6AlUMcVD/cg3qms++pY5jt3MfkMtqrJa6HB3xgCv8lE=
X-Received: by 2002:a05:6a00:240f:b0:52e:f99d:1157 with SMTP id
 z15-20020a056a00240f00b0052ef99d1157mr15885273pfh.70.1661768130939; Mon, 29
 Aug 2022 03:15:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:903:1c3:b0:172:ea50:dee8 with HTTP; Mon, 29 Aug 2022
 03:15:30 -0700 (PDT)
Reply-To: mrtonyelumelu98@gmail.com
From:   "Mrs. Cristalina Georgieva" <patriciapatricia78443@gmail.com>
Date:   Mon, 29 Aug 2022 11:15:30 +0100
Message-ID: <CAJSLDUmhhXWtpkdWR8_W2iTdKBiOELpS=c7ZRvWWPXCWF-9n1g@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:544 listed in]
        [list.dnswl.org]
        *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9838]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [patriciapatricia78443[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [patriciapatricia78443[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrtonyelumelu98[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

IOWbvemam+mAmuiyqOWfuumHkSAoSU1GKQ0K5Zu96Zqb5YK15YuZ566h55CG6KqyDQrvvIMxOTAw
44CBQVYuRFXnpL7plbcNCg0KSS5NLkYuIOODh+OCo+ODrOOCr+OCv+ODvOOBruWFrOW8j+mbu+Wt
kOODoeODvOODqyDjgqLjg4njg6zjgrnjgbjjgojjgYbjgZPjgZ3jgILjgq/jg6rjgrnjgr/jg6rj
g7zjg4rjg7vjgrLjgqrjg6vjgq7jgqjjg68NCg0KDQropqrmhJvjgarjgovlj5fnm4rogIXvvIEN
Cg0K5paw44Gf44Gr5Lu75ZG944GV44KM44Gf6LKh5YuZ6ZW35a6Y44Go5Zu96YCj6YCa6LKo5b2T
5bGA44Gu57Wx5rK75qmf6Zai44Gv44CB5Zu96YCj5pS/5bqc44Gr6ZW344GE6ZaT5YK15YuZ44KS
6LKg44Gj44Gm44GE44Gf5pyq6KuL5rGC44Gu6LOH6YeR44KS6Kq/5p+744GZ44KL44GT44Go44KS
6Kix5Y+v44GX44Gf44Gf44KB44CB5omA5pyJ6ICF44Gv6KmQ5qy644Gn5ZGK55m644GV44KM44G+
44GX44GfLuWbvemAo+OBruWQjeWJjeOCkuS9v+eUqOOBl+OBn+ipkOasuuW4q+OAguiqv+afu+S4
reOBruOCt+OCueODhuODoOOBrumbu+WtkOODoeODvOODqw0K44Ki44OJ44Os44K544Gu44OH44O8
44K/IOOCueODiOODrOODvOOCuOiomOmMsuOBq+OCiOOCi+OBqOOAgeOBguOBquOBn+OBruaUr+aJ
leOBhOOBr+OAgeasoeOBruOCq+ODhuOCtOODquOBriAxNTAg5Lq644Gu5Y+X55uK6ICF44Gu44Oq
44K544OI44Gr5ZCr44G+44KM44Gm44GE44G+44GZ44CC5aWR57SE6LOH6YeR44CCDQoNCuOBguOB
quOBn+OBruizh+mHkeOCkuOBoOOBvuOBl+WPluOCi+OBn+OCgeOBq+axmuiBt+OCkueKr+OBl+OB
n+iFkOaVl+OBl+OBn+mKgOihjOiBt+WToeOBr+OAgeOBguOBquOBn+OBruaUr+aJleOBhOOCkuS4
jeW9k+OBq+mBheOCieOBm+OAgeOBguOBquOBn+OBruWBtOOBq+WkmuOBj+OBruiyu+eUqOOBjOOB
i+OBi+OCiuOAgeOBguOBquOBn+OBruaUr+aJleOBhOOBruWPl+OBkeWFpeOCjOOBjOS4jeW9k+OB
q+mBheOCjOOBvuOBl+OBny7lm73pgKPjgajlm73pmpvpgJrosqjln7rph5ENCihJTUYpIOOBr+OA
geWMl+exs+OAgeWNl+exs+OAgeexs+WbveOAgeODqOODvOODreODg+ODkeOAgeOCouOCuOOCouOA
geOBiuOCiOOBs+S4lueVjOS4reOBriBBVE0gVmlzYSDjgqvjg7zjg4njgpLkvb/nlKjjgZfjgaYg
MTUwDQrkurrjga7lj5fnm4rogIXjgavjgZnjgbnjgabjga7oo5zlhJ/jgpLmlK/miZXjgYbjgZPj
gajjgpLpgbjmip7jgZfjgb7jgZfjgZ/jgILjgZPjga7jgrDjg63jg7zjg5Djg6vjgarmlK/miZXj
gYTmioDooZPjgYzliKnnlKjlj6/og73jgafjgYLjgovjgZ/jgoHjgafjgZnjgILmtojosrvogIXj
gIHkvIHmpa3jgIHph5Hono3mqZ/plqLjgavjgILmlL/lupzjgYznj77ph5HjgoTlsI/liIfmiYvj
ga7ku6Pjgo/jgorjgavjg4fjgrjjgr/jg6vpgJrosqjjgpLkvb/nlKjjgafjgY3jgovjgojjgYbj
gavjgZfjgb7jgZnjgIINCg0KQVRNIFZpc2Hjgqvjg7zjg4njgpLkvb/nlKjjgZfjgabmlK/miZXj
gYTjgpLooYzjgYbjgojjgYbjgavmiYvphY3jgZfjgb7jgZfjgZ/jgILjgqvjg7zjg4njga/nmbro
oYzjgZXjgozjgIHliKnnlKjlj6/og73jgarlroXphY3jgrXjg7zjg5PjgrnjgpLku4vjgZfjgabn
m7TmjqXkvY/miYDjgavpgIHjgonjgozjgb7jgZnjgILjgZTpgKPntaHlvozjgIExLDUwMCwwMDAu
MDANCuexs+ODieODq+OBrumHkemhjeOBjCBBVE0gVmlzYSDjgqvjg7zjg4njgavou6LpgIHjgZXj
gozjgb7jgZnjgILjgZPjgozjgavjgojjgorjgIHjgYrkvY/jgb7jgYTjga7lm73jga4gQVRNIOOB
i+OCiSAxIOaXpeOBguOBn+OCiuWwkeOBquOBj+OBqOOCgiAxMCwwMDANCuexs+ODieODq+OCkuW8
leOBjeWHuuOBmeOBk+OBqOOBp+OAgeOBiumHkeOCkuW8leOBjeWHuuOBmeOBk+OBqOOBjOOBp+OB
jeOBvuOBmeOAguOBlOimgeacm+OBq+W/nOOBmOOBpuOAgTEg5pel44GC44Gf44KKIDIwLDAwMC4w
MA0K44OJ44Or44G+44Gn5LiK6ZmQ44KS5byV44GN5LiK44GS44KL44GT44Go44GM44Gn44GN44G+
44GZ44CC44GT44KM44Gr6Zai44GX44Gm44CB5Zu96Zqb5pSv5omV44GK44KI44Gz6YCB6YeR5bGA
44Gr6YCj57Wh44GX44CB6KaB5rGC44GV44KM44Gf5oOF5aCx44KS5qyh44Gu5pa55rOV44Gn5o+Q
5L6b44GZ44KL5b+F6KaB44GM44GC44KK44G+44GZ44CCDQoNCjEu44GC44Gq44Gf44Gu44OV44Or
44ON44O844OgLi4uLi4uLi4uDQoyLuOBguOBquOBn+OBruWujOWFqOOBquS9j+aJgC4uLi4uLi4u
DQozLiDlm73nsY0gLi4uLi4uLi4uLi4uLi4uLi4NCjQu55Sf5bm05pyI5pel44O75oCn5Yil4oCm
4oCm4oCm4oCmDQo1LuWwgumWgOaApy4uLi4uLi4uDQo2LiDpm7voqbHnlarlj7cgLi4uLi4uLi4u
Lg0KNy4g5b6h56S+44Gu44Oh44O844Or44Ki44OJ44Os44K54oCm4oCmDQo4LuWAi+S6uuOBruOD
oeODvOODq+OCouODieODrOOCueKApuKApg0KDQoNCuOBk+OBruOCs+ODvOODiSAo44Oq44Oz44Kv
OiBDTElFTlQtOTY2LzE2KSDjgpLorZjliKXjgZnjgovjgavjga/jgIHpm7vlrZDjg6Hjg7zjg6vj
ga7ku7blkI3jgajjgZfjgabkvb/nlKjjgZfjgIHkuIroqJjjga7mg4XloLHjgpLmrKHjga7lvpPm
pa3lk6Hjgavmj5DkvpvjgZfjgaYgQVRNDQpWaXNhIOOCq+ODvOODieOBrueZuuihjOOBqOmFjemA
geOCkuS+nemgvOOBl+OBpuOBj+OBoOOBleOBhOOAgg0KDQrpioDooYzmi4XlvZPogIXjgYzjgZPj
ga7mlK/miZXjgYTjgpLov73ot6HjgZfjgIHjg6Hjg4Pjgrvjg7zjgrjjgpLkuqTmj5vjgZfjgabj
gIHos4fph5Hjga7jgZXjgonjgarjgovpgYXlu7bjgoToqqTjgaPjgZ/mlrnlkJHku5jjgZHjgpLp
mLLjgZDjgZPjgajjgYzjgafjgY3jgovjgojjgYbjgavjgIHmlrDjgZfjgYTnlarlj7fjgaflgIvk
urrjga7pm7vlrZDjg6Hjg7zjg6sNCuOCouODieODrOOCueOCkumWi+OBj+OBk+OBqOOCkuOBiuWL
p+OCgeOBl+OBvuOBmeOAguS7peS4i+OBrumAo+e1oeWFiOaDheWgseOCkuS9v+eUqOOBl+OBpuOA
geODpuODiuOCpOODhuODg+ODiSDjg5Djg7Pjgq8g44Kq44OWIOOCouODleODquOCq+OBruOCqOOD
vOOCuOOCp+ODs+ODiOOBq+S7iuOBmeOBkOOBlOmAo+e1oeOBj+OBoOOBleOBhOOAgg0KDQrpgKPn
taHnqpPlj6PvvJrjg4jjg4vjg7zjg7vjgqjjg6vjg6Hjg6vmsI8NCuijnOWEn+mHkemAgemHkemD
qCBVbml0ZWQgQmFuayBvZiBBZnJpY2Eg6YCj57Wh5YWI44Oh44O844Or44Ki44OJ44Os44K5OiAs
KG1ydG9ueWVsdW1lbHU5OEBnbWFpbC5jb20pDQoNCuOBk+OCjOS7peS4iuOBrumBheOCjOOCkumB
v+OBkeOCi+OBn+OCgeOBq+OAgeOBk+OBruODoeODvOODq+OBuOOBrui/hemAn+OBquWvvuW/nOOB
jOW/heimgeOBp+OBmeOAgg0KDQrmlazlhbcNCuOCr+ODquOCueOCv+ODquODvOODiuODu+OCsuOC
quODq+OCruOCqOODkOWkq+S6ug0K
